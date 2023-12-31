#!/bin/bash
echo "**** Begin installing Ubuntu, etc"

sudo apt update
sudo apt upgrade -y

echo "**** Begin installing ubuntu-desktop"
sudo apt install ubuntu-desktop -y
sudo timedatectl set-timezone Europe/Berlin
echo "**** End installing ubuntu-desktop"

#Guest Additions
sudo apt install build-essential dkms linux-headers-$(uname -r) -y

#Auto login
echo "**** Begin setting up auto login"
sudo sed -i 's/#  AutomaticLoginEnable = true/AutomaticLoginEnable = true/g' /etc/gdm3/custom.conf
sudo sed -i 's/#  AutomaticLogin = user1/AutomaticLogin = vagrant/g' /etc/gdm3/custom.conf
echo "**** End setting up auto login"


echo "**** Begin installing Visual Studio Code"
#Install the apt repository and signing key to enable auto-updating using the system's package manager
sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

#Update the package cache and install the package
sudo apt install apt-transport-https
sudo apt update
sudo apt install code
echo "**** End installing Visual Studio Code"

#Install Chrome
echo "**** Begin installing Chrome"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome*.deb -y
rm -f google-chrome*.deb
echo "**** End installing Chrome"

echo "**** Begin installing Node.js"
# Using Ubuntu
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs
echo "**** End installing Node.js"

echo "**** End installing Ubuntu, etc"