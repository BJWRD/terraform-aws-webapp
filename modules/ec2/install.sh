#! /bin/bash
sudo yum install yum-utils -y
sudo yum-config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo yum install docker-ce docker-ce-cli containerd.io -y
sudo systemctl docker.service enable --now
sudo systemctl containerd.service enable --now
sudo curl -L "https://github.com/docker/compose/releases/tag/v2.10.2/docker-compose-$(uname -s)-$(uname-m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose 
