#!/usr/bin/env bash

sudo apt update -y 
sudo apt-get upgrade -y

sudo apt install git -y
sudo wget https://s3.amazonaws.com/amazon-ssm-eu-west-1/latest/debian_amd64/amazon-ssm-agent.deb -y
sudo dpkg -i amazon-ssm-agent.deb

sudo wget https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb
sudo dpkg -i amazon-cloudwatch-agent.deb
sudo systemctl start amazon-cloudwatch-agent
sudo systemctl status amazon-cloudwatch-agent

curl -O https://inspector-agent.amazonaws.com/linux/latest/install
sudo bash install

sudo apt-get install docker.io -y
sudo systemctl start docker


