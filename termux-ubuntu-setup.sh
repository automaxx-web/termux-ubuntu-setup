#!/bin/bash
set -e

echo "=================================================="
echo "Termux Ubuntu Full Setup"
echo "=================================================="

pkg update -y
pkg upgrade -y
pkg install -y git curl wget vim nano python python-pip nodejs proot-distro

proot-distro install ubuntu

proot-distro login ubuntu -- bash -lc '
set -e
apt update -y
apt upgrade -y
apt install -y build-essential git curl wget vim nano python3 python3-pip nodejs npm \
  gcc g++ make cmake gdb htop tmux screen openssh-client sqlite3 \
  postgresql-client mysql-client openjdk-11-jdk

apt clean
apt autoclean

echo "Ubuntu environment ready!"
echo "Use: proot-distro login ubuntu"
'
