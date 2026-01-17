#!/usr/bin/env bash

. /etc/os-release

case "$ID" in
  ubuntu|debian|linuxmint|pop)
    PM="apt"
    ;;
  fedora|rhel|centos|rocky|almalinux)
    PM="dnf"
    ;;
  arch|manjaro|endeavouros)
    PM="pacman"
    ;;
  opensuse*|sles)
    PM="zypper"
    ;;
  alpine)
    PM="apk"
    ;;
  void)
    PM="xbps-install"
    ;;
  gentoo)
    PM="emerge"
    ;;
  *)
    PM="unknown"
    ;;
esac

echo "Package manager: $PM"

