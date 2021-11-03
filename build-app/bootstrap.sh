#!/usr/bin/env bash

# Install git
sudo yum install git -y

# Install golang
sudo yum install golang -y 

# Install node js
curl -sL https://rpm.nodesource.com/setup_14.x | sudo bash -
sudo yum install nodejs -y

# Install vuejs
sudo npm install -g @vue/cli

# ----------  Verify instalations --------------
# Git version
git --version

# Go version
go version

# Node version
node --version

# Npm version
npm --version

# Vue version
vue --version

# -------------- End isntalations verify --------------

# Clone repo
git clone https://github.com/jdmendozaa/vuego-demoapp 

# move into the project
cd vuego-demoapp/server

# Build go project and pass it to shared
go build -o /shared/server

# Go to the frontend project
cd ../spa/

# Put correct enviroment variable in frontend project
sudo echo 'VUE_APP_API_ENDPOINT="http://10.0.0.8:4001/api"' >> .env.production.local

# Build node modules
sudo npm i

# Create the build of the project
sudo npm run build

# Compress files
tar -zcvf frontend.tar.gz ./dist

# Move file to the frontend
mv frontend.tar.gz /shared