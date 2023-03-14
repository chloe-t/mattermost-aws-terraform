#!/bin/bash

exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
echo ------------------------BEGIN

# Install Docker 
apt update -y
apt install docker.io -y
systemctl start docker

# Install Docker compose
apt-get update -y
apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update -y
apt-get install docker-compose-plugin -y

# Install Mattermost
git clone https://github.com/mattermost/docker
cd docker
cp env.example .env

# Configure DOMAIN variable and MATTERMOST_IMAGE
sed -i -e 's/DOMAIN=.*/DOMAIN=mattermost.capitech.fr/g' \
       -e 's/mattermost-enterprise-edition/mattermost-team-edition/g' \
        .env

mkdir -p ./volumes/app/mattermost/{config,data,logs,plugins,client/plugins,bleve-indexes}
chown -R 2000:2000 ./volumes/app/mattermost

# Up docker container
docker compose -f docker-compose.yml -f docker-compose.without-nginx.yml up -d

echo ------------------------END