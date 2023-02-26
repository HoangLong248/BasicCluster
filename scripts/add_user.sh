#!/bin/bash

sudo useradd -m ansible
sudo echo "ansible:P@ssWord123" | sudo chpasswd
sudo echo "%ansible ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/ansible
sudo useradd -m long.tran
sudo echo "long.tran:longtran@123" | sudo chpasswd
sudo echo "%long.tran ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/long.tran

sudo sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo systemctl restart sshd