#!/usr/bin/bash
yum update -y
yum search docker
yum install docker -y
usermod -a -G docker ec2-user
newgrp docker
systemctl enable docker.service
systemctl start docker.service
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 822626997628.dkr.ecr.ap-south-1.amazonaws.com
docker run --name myapp -d -p 8000:5001 822626997628.dkr.ecr.ap-south-1.amazonaws.com/pipeline-demo:v1
