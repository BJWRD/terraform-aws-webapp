#!/bin/bash
#VM Startup Script
sudo yum update -y
sudo mkdir /home/ec2-user/files
#Dockerfile
sudo echo "FROM ubuntu

RUN apt-get update
RUN apt-get install -y python3
RUN apt-get install -y python3-pip
RUN pip install flask

#Copy the app.py file from the current folder to /opt inside the container
COPY app.py /opt/app.py
EXPOSE 8080

ENTRYPOINT FLASK_APP=/opt/app.py flask run --host=0.0.0.0 --port=8080

#To ensure that the container continues to run and doesn't stop
ENTRYPOINT FLASK_APP=/opt/app.py tail -f /dev/null" >> /home/ec2-user/files/Dockerfile
#Python file - app.py
sudo echo "import os
from flask import Flask
app = Flask(_name_)

@app.route("/")
def main():
    return "Hello World!"

if_name_ == "_main_":
    app_run()" >> /home/ec2-user/files/app.py
#Docker-compose file - docker-compose.yml
sudo echo "version: "("3.9")"
services:
  web:
    build: .
    ports:
      - "8080:8080"" >>/home/ec2-user/files/docker-compose.yml

sudo chown ec2-user:ec2-user /home/ec2-user/files
sudo chown ec2-user:ec2-user /home/ec2-user/files/*
sudo amazon-linux-extras install docker -y
sudo systemctl enable docker --now
sudo systemctl enable containerd.service --now
sudo usermod -a -G docker ec2-user
sudo chmod 666 /var/run/docker.sock
sudo curl -L https://github.com/docker/compose/releases/download/v2.11.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo docker-compose up -d
