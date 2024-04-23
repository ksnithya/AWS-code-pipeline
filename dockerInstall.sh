#!/usr/bin/bash
yum update -y
yum install docker -y
usermod -a -G docker ec2-user
newgrp docker
systemctl enable docker.service
systemctl start docker.service
aws ecr get-login-password --region 822626997628.dkr.ecr.ap-south-1.amazonaws.com/pipeline-demo | docker login --username AWS --password-stdin 822626997628.dkr.ecr.ap-south-1.amazonaws.com
declare -i x
x=$(docker ps -a|grep -w "myapp"|wc -l)
if [ $x -ge 1 ]
then
  docker stop myapp
  docker rm myapp
  docker run --name myapp -d -p 8000:5001 822626997628.dkr.ecr.ap-south-1.amazonaws.com/pipeline-demo:v2
else
  docker run --name myapp -d -p 8000:5001 822626997628.dkr.ecr.ap-south-1.amazonaws.com/pipeline-demo:v2
fi
