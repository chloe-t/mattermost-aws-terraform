# Install Docker 
sudo apt update -y
sudo apt install docker.io -y
sudo systemctl start docker

# Install Docker compose
sudo apt-get update -y
sudo apt-get install docker-compose-plugin -y

# Install Mattermost
git clone https://github.com/mattermost/docker
cd docker
cp env.example .env

# Configure DOMAIN variable and MATTERMOST_IMAGE
sed -i -e 's/DOMAIN=.*/DOMAIN=mattermost.capitech.fr/g' \
       -e 's/mattermost-enterprise-edition/mattermost-team-edition/g' \
        .env

mkdir -p ./volumes/app/mattermost/{config,data,logs,plugins,client/plugins,bleve-indexes}
sudo chown -R 2000:2000 ./volumes/app/mattermost

# Up docker container
sudo docker compose -f docker-compose.yml -f docker-compose.without-nginx.yml up -d