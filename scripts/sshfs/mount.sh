#!/bin/bash

#remeber to set the variables
#$remotepath format: /path/to/remote/folder
#$localpath format: /mnt/yourmountpoint
#$IdentityFilePath default: /root/.ssh/id_ecdsa
#$compression format: yes/no
echo "$user@$servername:$remotepath  $localpath fuse.sshfs  defaults,allow_other,_netdev,user,reconnect,compression=$compression,nonempty,IdentityFile=$IdentityFilePath  0  0">> /etc/fstab
