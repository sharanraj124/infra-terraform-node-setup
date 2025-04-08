#!/bin/bash
yum update -y
amazon-linux-extras install docker -y
service docker start
usermod -a -G docker ec2-user

# Optional: Login to ECR if you're pulling from there
# aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin <your_account_id>.dkr.ecr.us-east-1.amazonaws.com

# Pull and run your container (either from ECR or build locally)
docker pull omrsaran/hello-node:latest
docker run -d -p 3000:3000 omrsaran/hello-node:latest

