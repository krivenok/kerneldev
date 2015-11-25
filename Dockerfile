FROM nfnty/arch-devel

MAINTAINER Dmitry Krivenok <dmitry.krivenok@emc.com>
RUN pacman --noconfirm -S kmod bc inetutils vim
