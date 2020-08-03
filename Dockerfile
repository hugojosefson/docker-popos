FROM ubuntu:20.04
MAINTAINER Hugo Josefson <hugo@josefson.org>

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get full-upgrade --auto-remove --purge -y

#RUN rm -rf /etc/update-motd.d
COPY src/etc/apt /etc/apt

RUN echo updating
RUN apt-get update
RUN apt-mark hold kernelstub
RUN apt-mark hold linux-image-5.4.0-7634-generic
RUN apt-mark hold linux-image-generic
RUN apt-mark hold linux-headers-5.4.0-7634-generic
RUN apt-mark hold linux-headers-generic
RUN apt-mark hold initramfs-tools
RUN echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections
RUN DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade --auto-remove --purge -y
RUN DEBIAN_FRONTEND=noninteractive apt-get full-upgrade --auto-remove --purge -y
RUN rm -rf /var/lib/apt/lists/*
#RUN yes | unminimize
