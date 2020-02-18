#!/bin/bash

#secure-ssh.sh
#author alex
#creates a new ssh user using $1 parameter
#removes root ability to ssh in
#should be run as root

# Prevent root logon
grep "PermitRootLogin yes" /etc/ssh/sshd_config
if [ $? == 0 ]; then
  sed -i 's/PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config
fi

# Exit if no user provided
if [ -z $1 ]; then
  echo Please provide a username!
  exit 1
fi

# Create user
useradd -m -d /home/$1 -s /bin/bash $1
mkdir /home/$1/.ssh
cp ../public-keys/id_rsa.pub /home/$1/.ssh/authorized_keys
chmod 700 /home/$1/.ssh
chmod 600 /home/$1/.ssh/authorized_keys
chown -R $1:$1 /home/$1/.ssh

