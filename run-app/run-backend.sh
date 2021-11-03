#!/usr/bin/env bash

# Go to shared folder where the binary file is ubicated
cd /shared

# Define Environment variables
sudo echo 'export PORT=4001' >> /etc/profile

# Execute the binary file on background
cd /shared/
# Run backend
nohup ./server > server.out 2>&1 &

# echo port used
echo $PORT