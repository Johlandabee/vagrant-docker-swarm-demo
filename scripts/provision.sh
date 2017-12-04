#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

# Add GPG Key and Docker repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Install latest docker stable
sudo apt-get update
sudo apt-get install docker-ce -y

# Set up groups 
sudo usermod -aG docker ubuntu

# Start Docker daemon
sudo service docker start
docker version
