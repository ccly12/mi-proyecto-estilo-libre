#!/bin/bash
apt update -y
apt install -y docker.io

systemctl enable docker
systemctl start docker

docker run -d \
  -p 5000:5000 \
  --restart=always \
  --name registry \
  registry:2