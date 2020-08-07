FROM hugojosefson/ubuntu:20.04
MAINTAINER Hugo Josefson <hugo@josefson.org>

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get full-upgrade --auto-remove --purge -y && rm -rf /var/lib/apt/lists/*

RUN echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections
RUN echo "Set disable_coredump false" >> /etc/sudo.conf
COPY src/etc/apt /etc/apt
RUN apt-get update
RUN apt-get install -y apt-utils aptitude sudo
RUN echo "********************** apt-get upgrade **********************" && apt-get -o Dpkg::Options::="--force-confnew" --fix-broken -y --purge --auto-remove --allow-downgrades --allow-remove-essential --allow-change-held-packages upgrade
#RUN apt-get install -y dlocate
#RUN echo "********************** apt-get install pop-desktop flatpak || true **********************" && apt-get -o Dpkg::Options::="--force-confnew" --fix-broken -y --purge --auto-remove --allow-downgrades --allow-remove-essential --allow-change-held-packages install pop-desktop flatpak || true
#RUN echo "********************** apt-get purge gnome-initial-setup initramfs-tools brltty || true **********************" && apt-get -o Dpkg::Options::="--force-confnew" --fix-broken -y --purge --auto-remove --allow-downgrades --allow-remove-essential --allow-change-held-packages purge gnome-initial-setup initramfs-tools brltty || true
#RUN echo "********************** dpkg --configure -a **********************" && dpkg --configure -a
#RUN echo "********************** apt-get purge kernelstub linux-image-5.4.0-7634-generic initramfs-tools || true **********************" && apt-get -o Dpkg::Options::="--force-confnew" --fix-broken -y --purge --auto-remove --allow-downgrades --allow-remove-essential --allow-change-held-packages purge kernelstub linux-image-5.4.0-7634-generic initramfs-tools || true
#RUN echo "********************** dpkg --configure -a **********************" && dpkg --configure -a
#RUN dpkg-purge 
RUN aptitude install \
#  pop-desktop+ flatpak+ \
  -y \
  ubuntu-desktop_ \
  ubuntu-desktop-minimal_ \
  gnome-initial-setup_ \
  initramfs-tools_ \
  brltty_ \
  orca_ \
  speech-dispatcher_ \
  kernelstub_ \
  linux-image-5.4.0-7634-generic_ \
  lilo_ \
  foomatic-db_ \
  foomatic-db-engine_ \
  initramfs-tools_

RUN aptitude install \
  pop-desktop+ flatpak+ \
  -y \
  ubuntu-desktop_ \
  ubuntu-desktop-minimal_ \
  gnome-initial-setup_ \
  initramfs-tools_ \
  brltty_ \
  orca_ \
  speech-dispatcher_ \
  kernelstub_ \
  linux-image-5.4.0-7634-generic_ \
  lilo_ \
  foomatic-db_ \
  foomatic-db-engine_ \
  initramfs-tools_
  
#RUN echo "********************** apt-get install pop-desktop flatpak **********************" && apt-get -o Dpkg::Options::="--force-confnew" --fix-broken -y --purge --auto-remove --allow-downgrades --allow-remove-essential --allow-change-held-packages install pop-desktop flatpak
#RUN echo "********************** apt-get install pop-desktop flatpak **********************" && apt-get -o Dpkg::Options::="--force-confnew" -y --purge --auto-remove --allow-downgrades --allow-remove-essential --allow-change-held-packages install pop-desktop flatpak
#RUN flatpak remote-add --if-not-exists "flathub" "https://flathub.org/repo/flathub.flatpakrepo"

#RUN apt-get \
#  -o Dpkg::Options::="--force-confnew" \
#  --purge \
#  --fix-broken \
#  --auto-remove \
#  --allow-downgrades \
#  --allow-remove-essential \
#  --allow-change-held-packages \
#  -y \
#  upgrade
#  
#RUN apt-get \
#  -o Dpkg::Options::="--force-confnew" \
#  --purge \
#  --fix-broken \
#  --auto-remove \
#  --allow-downgrades \
#  --allow-remove-essential \
#  --allow-change-held-packages \
#  -y \
#  install pop-desktop flatpak \
#  || true
#  
#RUN apt-get \
#  -o Dpkg::Options::="--force-confnew" \
#  --purge \
#  --fix-broken \
#  --auto-remove \
#  --allow-downgrades \
#  --allow-remove-essential \
#  --allow-change-held-packages \
#  -y \
#  purge gnome-initial-setup
#  
#RUN dpkg --configure -a
#  
#RUN apt-get \
#  -o Dpkg::Options::="--force-confnew" \
#  --purge \
#  --fix-broken \
#  --auto-remove \
#  --allow-downgrades \
#  --allow-remove-essential \
#  --allow-change-held-packages \
#  -y \
#  install pop-desktop flatpak
#  
#RUN flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
