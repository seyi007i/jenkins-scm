#!/bin/bash

# Installing Dependencies
echo "########################################"
echo "Installing packages."
echo "########################################"
sudo apt update -y
sudo apt install wget unzip apache2 -y >/dev/null
echo

# Creating Temp Directory
echo "########################################"
echo "Starting Artifact Deployment"
echo "########################################"
mkdir -p /tmp/webfiles
cd /tmp/webfiles
echo

wget https://www.tooplate.com/zip-templates/2131_wedding_lite.zip > /dev/null
unzip 2131_wedding_lite.zip > /dev/null
sudo cp -r 2131_wedding_lite/* /var/www/html/
echo

# Bounce Service
echo "########################################"
echo "Restarting Apache Webserver service"
echo "########################################"
systemctl restart apache2
echo

# Clean Up
echo "########################################"
echo "Removing Temporary Files"
echo "########################################"
rm -rf /tmp/webfiles
echo

ls /var/www/html/
sudo systemctl status apache2

