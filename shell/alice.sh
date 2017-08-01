#!/bin/bash

sudo apt-get update
sudo apt-get install -y sshpass
echo 'ubuntu:vagrant2' | sudo chpasswd

echo "172.28.128.30 bob bob.test" | sudo tee -a /etc/hosts

