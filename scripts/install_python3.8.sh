#!/bin/bash

install()   {
    sudo yum -y install epel-release
    sudo yum -y groupinstall "Development Tools"
    sudo yum -y install openssl-devel bzip2-devel libffi-devel xz-devel wget 

    cd /tmp && sudo wget https://www.python.org/ftp/python/3.8.12/Python-3.8.12.tgz && tar xvf Python-3.8.12.tgz 
    cd Python-3.8.12 && ./configure --enable-optimizations && sudo make altinstall

    sudo rm -rf /tmp/Python-3.8.12 /tmp/Python-3.8.12.tgz
}