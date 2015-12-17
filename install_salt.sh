#!/bin/bash

# We want to work with a recent version of saltstack, so we pull directly
# from the saltstack repository. Also, for now we need a (local) master, 
# otherwise the scheduler woun't work as expected.

 
# Get and install the gpg key the saltstack repo is signed with
#
wget -O - https://repo.saltstack.com/apt/ubuntu/14.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -

# Add the saltstack repo
#
echo "deb http://repo.saltstack.com/apt/ubuntu/14.04/amd64/latest trusty main" > /etc/apt/sources.list.d/saltstack.list

# Update the packet index
#
apt-get update

# Install saltstack (master and minion)
#
apt-get install salt-master salt-minion

# Configure the local master
#
echo "127.0.0.1 salt" >> /etc/hosts

# Add the minion to the local master
#
#salt-key -l
#salt-key -a <minion-id>
