#!/bin/bash
VERSION=`cat include/config/kernel.release`
sudo mkinitcpio -A dev_hook -k $VERSION -g initramfs-${VERSION}.img
