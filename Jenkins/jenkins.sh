#!/bin/bash

# Install dependencies
sudo apt-get update
sudo apt-get install -y openjdk-8-jdk

# Add Jenkins repository
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

# Install Jenkins
sudo apt-get update
sudo apt-get install -y jenkins

# Start Jenkins service
sudo systemctl start jenkins

# Enable Jenkins service to start on boot
sudo systemctl enable jenkins

echo