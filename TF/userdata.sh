#!/bin/bash

sudo apt update
sudo apt install nginx -y
sudo systemctl start nignx
sudo systemctl enable nginx
echo "Hello World from AVYAAN" | sudo tee /var/www/html/index.html