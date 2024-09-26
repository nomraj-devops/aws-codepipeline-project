#!/bin/bash
sudo -u root aws ecr get-login-password --region ap-southeast-1 | docker login --username AWS --password-stdin 863936362823.dkr.ecr.ap-southeast-1.amazonaws.com
sudo -u root docker rm -f `docker ps -q -a`
sudo -u root docker rmi -f `docker images -q`
sleep 3
sudo -u root docker pull 863936362823.dkr.ecr.ap-southeast-1.amazonaws.com/aws-codepipeline-project:latest
if [[ $? != 0 ]]
then
    sudo -u root aws ecr get-login-password --region ap-southeast-1 | docker login --username AWS --password-stdin 863936362823.dkr.ecr.ap-southeast-1.amazonaws.com
    sudo -u root docker pull 863936362823.dkr.ecr.ap-southeast-1.amazonaws.com/aws-codepipeline-project:latest
fi
sudo -u root docker run -d -p 80:3000 --name aws-codepipeline-project 863936362823.dkr.ecr.ap-southeast-1.amazonaws.com/aws-codepipeline-project:latest
