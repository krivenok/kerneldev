FROM nfnty/arch-devel

MAINTAINER Dmitry Krivenok <dmitry.krivenok@emc.com>

# Install stuff missing in base container.
RUN pacman --noconfirm -Sy
RUN pacman --noconfirm -S kmod bc inetutils vim mkinitcpio iasl vi qemu util-linux strace indent
RUN pacman --noconfirm -S extra/perl-mime-tools community/perl-authen-sasl community/perl-net-smtp-ssl

# Copy files used to build initramfs
COPY dev_hook /usr/lib/initcpio/install/dev_hook
COPY runtime_dev_hook /usr/lib/initcpio/hooks/dev_hook
COPY build_initcpio.sh /usr/bin/build_initcpio.sh

# Add users and setup password less sudo
RUN useradd dk
RUN echo "root:root" | chpasswd
RUN echo 'dk ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

# Setup home directory
RUN mkdir /home/dk
RUN git clone https://github.com/krivenok/conf.git /tmp/conf
RUN mv /tmp/conf/home/.[a-zA-Z0-9]* /home/dk
RUN rm -rf /tmp/conf
RUN mkdir -p /home/dk/.vim/doc
RUN chown -R dk:dk /home/dk
ENV HOME /home/dk

COPY run_kernel_in_qemu.sh /usr/bin/run_kernel_in_qemu.sh
