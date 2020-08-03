FROM hugojosefson/ubuntu:20.04
MAINTAINER Hugo Josefson <hugo@josefson.org>

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get full-upgrade --auto-remove --purge -y && rm -rf /var/lib/apt/lists/*

RUN echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections
COPY src/etc/apt /etc/apt
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get upgrade --auto-remove --purge -y && rm -rf /var/lib/apt/lists/*
