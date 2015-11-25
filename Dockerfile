FROM nfnty/arch-devel

MAINTAINER Dmitry Krivenok <dmitry.krivenok@emc.com>

# Install stuff missing in base container.
RUN pacman --noconfirm -S kmod bc inetutils vim mkinitcpio iasl vi

# Copy files used to build initramfs
COPY dev_hook /usr/lib/initcpio/install/dev_hook
COPY build_initcpio.sh /usr/bin/build_initcpio.sh

# Add users and setup password less sudo
RUN useradd dk
RUN echo "root:root" | chpasswd
RUN echo 'dk ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

# Setup home directory
RUN mkdir /home/dk
RUN chown dk:dk /home/dk
ENV HOME /home/dk
