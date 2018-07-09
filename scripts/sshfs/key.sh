#!/bin/bash
if [ ! -r $HOME/.ssh/id_ecdsa ]; then ssh-keygen -b 521 -t ecdsa; fi
if [ $port != 22];
    then ssh-copy-id $user@$servername;
else
ssh-copy-id $user@$servername:$port;
fi
