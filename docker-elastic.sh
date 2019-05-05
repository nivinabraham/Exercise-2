#!/bin/bash

# update ubuntu
printf "\033[1;31mchecking for system updates\033[0m\n"
sleep 5s
sudo apt-get update
# Install Docker prerequesites
printf "\033[1;31minstalling Docker pre-requisites\033[0m\n"
sleep 5s
sudo apt-get install \
            apt-transport-https \
                ca-certificates \
                    curl \
                        gnupg-agent \
                            software-properties-common -y
# Fetch Docker CPG Key
printf "\033[1;31mfetching docker CPG key\033[0m\n"
sleep 5s
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# Get Stable Docker repository
printf "\033[1;31msetting stable repository for docker\033[0m\n"
sleep 5s
sudo add-apt-repository \
           "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
              $(lsb_release -cs) \
                 stable"
# Install Docker
printf "\033[1;31minstalling docker\033[0m\n"
sleep 5s
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
# Create Elasticsearch Node
printf "\033[1;31mpulling elasticsearch 7.0.1 image and installing\033[0m\n"
sleep 5s
sudo docker run -d -p 9200:9200 -e "discovery.type=single-node" \
        -v esdata:/usr/share/elasticsearch/data \
docker.elastic.co/elasticsearch/elasticsearch:7.0.1

sleep 20s

# Check health check of elasticsearch
printf "\033[1;31mhealth status of elasticsearch container\033[0m\n"
curl http://localhost:9200/_cluster/health?pretty
sleep 5s