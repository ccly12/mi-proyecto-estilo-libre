#!/bin/bash
apt update -y
apt install -y docker.io docker-compose openjdk-17-jdk

systemctl enable docker
systemctl start docker

# Crear carpeta y dar permisos
mkdir -p /app/jenkins_home
chown -R 1000:1000 /app/jenkins_home

cd /app

cat > docker-compose.yml <<EOT
version: '3'
services:
  jenkins:
    image: jenkins/jenkins:lts
    container_name: jenkins
    user: root
    ports:
      - "8080:8080"
      - "50000:50000"
    volumes:
      - ./jenkins_home:/var/jenkins_home
      - /var/run/docker.sock:/var/run/docker.sock
    restart: always
EOT

docker-compose up -d