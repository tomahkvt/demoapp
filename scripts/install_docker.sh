#!/bin/bash -xe

sudo apt update
sudo apt-get -y install ca-certificates curl gnupg lsb-release build-essential
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

sudo usermod -aG docker ubuntu

sudo bash -c 'cat << EOF >> /etc/systemd/resolved.conf
DNS=192.168.49.2
Domains=~demoonair.com ~local
EOF'

sudo systemctl restart systemd-resolved.service

sudo sed -i '/containerd.sock/ s/$/ --insecure-registry registry.demoonair.com/' /lib/systemd/system/docker.service
sudo systemctl daemon-reload
sudo systemctl restart docker.service

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
