#!/bin/bash

# stolen -- silently
vagrant ssh alice -c "sshpass -p vagrant3 ssh -o StrictHostKeyChecking=yes -o HashKnownHosts=no bob.test 'date && touch /tmp/demo'"

# from alice log into bob -- good day sir
