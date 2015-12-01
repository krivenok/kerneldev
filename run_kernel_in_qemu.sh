#!/bin/bash

if [ ! -e "/dev/kvm" ]; then
  sudo mknod /dev/kvm c 10 $(grep '\<kvm\>' /proc/misc | cut -f 1 -d' ')
fi

VERSION=`cat include/config/kernel.release`
sudo qemu-system-x86_64 -enable-kvm \
      -m 4096,maxmem=128G,slots=10 \
      -display none -serial stdio \
      -kernel  arch/x86/boot/bzImage \
      -initrd ./initramfs-${VERSION}.img \
      -append "console=ttyS0 ignore_loglevel early_printk=serial,ttyS0"
