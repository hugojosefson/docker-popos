FROM hugojosefson/ubuntu:20.04
MAINTAINER Hugo Josefson <hugo@josefson.org>

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get full-upgrade --auto-remove --purge -y && rm -rf /var/lib/apt/lists/*

RUN echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections
RUN echo "Set disable_coredump false" >> /etc/sudo.conf
COPY src/etc/apt /etc/apt
RUN apt-get update
RUN apt-get install -y apt-utils
#RUN apt-get purge -y --auto-remove gnome-initial-setup kernelstub linux-image-5.4.0-7634-generic initramfs-tools
RUN apt-get -o Dpkg::Options::="--force-confnew" --fix-broken -y upgrade --allow-downgrades --allow-remove-essential --allow-change-held-packages
