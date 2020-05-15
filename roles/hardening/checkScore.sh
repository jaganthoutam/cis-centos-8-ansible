#!/bin/sh
if command -v yum; then
  PKG="yum"

sudo "$PKG" -y update
sudo "$PKG" -y install git

git clone https://github.com/CISOFy/lynis

sudo chown -R root:root lynis
sudo chmod a+rx lynis
cd lynis || exit 1

LANG=C sudo ./lynis audit system
sudo cp '/var/log/lynis-report.dat' ~/
echo "ansible_version=$(ansible --version | grep '^ansible')" >> ~/lynis-report.dat
