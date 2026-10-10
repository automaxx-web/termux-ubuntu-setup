#!/bin/bash
set -e

clear
echo "╔════════════════════════════════════════════════════════════╗"
echo "║     TERMUX + UBUNTU COMPLETE SETUP AND LAUNCH SCRIPT       ║"
echo "║           Install All Requirements & Launch                ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

print_step() { echo -e "${BLUE}[STEP]${NC} $1"; }
print_success() { echo -e "${GREEN}[✓]${NC} $1"; }
print_error() { echo -e "${RED}[✗]${NC} $1"; }
print_warning() { echo -e "${YELLOW}[!]${NC} $1"; }

print_step "Updating Termux packages..."
pkg update -y
pkg upgrade -y
print_success "Termux packages updated"
echo ""

print_step "Installing essential Termux packages..."
pkg install -y git curl wget vim nano python python-pip nodejs proot-distro
print_success "Essential packages installed"
echo ""

print_step "Installing Ubuntu via proot-distro..."
print_warning "This may take 2-5 minutes..."
proot-distro install ubuntu
print_success "Ubuntu installed"
echo ""

print_step "Setting up Ubuntu environment with all requirements..."
proot-distro login ubuntu -- bash << 'UBUNTU_SETUP'
set -e
export DEBIAN_FRONTEND=noninteractive

echo "Updating Ubuntu packages..."
apt update -y
apt upgrade -y

echo "Installing development tools..."
apt install -y build-essential git curl wget vim nano python3 python3-pip python3-venv nodejs npm gcc g++ make cmake gdb

echo "Installing system utilities..."
apt install -y htop tmux screen openssh-client net-tools tree

echo "Installing databases & clients..."
apt install -y sqlite3 postgresql-client mysql-client

echo "Installing Java..."
apt install -y openjdk-11-jdk

echo "Installing additional tools..."
apt install -y zip unzip tar gzip ffmpeg imagemagick ghostscript

echo "Cleaning up..."
apt clean
apt autoclean
apt autoremove -y

echo "Setup complete!"
UBUNTU_SETUP

print_success "Ubuntu environment fully configured"
echo ""

clear
echo "╔════════════════════════════════════════════════════════════╗"
echo "║              SETUP COMPLETED SUCCESSFULLY!                 ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""
echo -e "${GREEN}Installed Components:${NC}"
echo "  ✓ Termux"
echo "  ✓ Ubuntu Container"
echo "  ✓ Build Tools"
echo "  ✓ Python3 and Node.js"
echo "  ✓ Git"
echo "  ✓ Htop, tmux, screen"
echo "  ✓ SQLite3, PostgreSQL, MySQL clients"
echo "  ✓ Java 11"
echo "  ✓ ffmpeg, ImageMagick"
echo ""
echo -e "${YELLOW}Quick Commands:${NC}"
echo "  • Launch Ubuntu:  ${BLUE}proot-distro login ubuntu${NC}"
echo "  • List distros:   ${BLUE}proot-distro list${NC}"
echo ""

echo -n "Would you like to launch Ubuntu now? (y/n): "
read -r launch_choice

if [[ "$launch_choice" =~ ^[Yy]$ ]]; then
    echo ""
    print_step "Launching Ubuntu environment..."
    echo ""
    proot-distro login ubuntu
else
    print_warning "Setup complete. Launch Ubuntu anytime with: proot-distro login ubuntu"
fi
