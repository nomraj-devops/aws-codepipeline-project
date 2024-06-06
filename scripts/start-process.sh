#!/bin/bash
sudo -u root aws ecr get-login-password --region ap-southeast-1 | docker login --username AWS --password-stdin 083341655278.dkr.ecr.ap-southeast-1.amazonaws.com
sudo -u root docker rm -f `docker ps -q -a`
sudo -u root docker rmi -f `docker images -q`
sleep 3
sudo -u root docker pull 083341655278.dkr.ecr.ap-southeast-1.amazonaws.com/aws-codepipeline-project:latest
if [[ $? != 0 ]]
then
    sudo -u root aws ecr get-login-password --region ap-southeast-1 | docker login --username AWS --password-stdin 083341655278.dkr.ecr.ap-southeast-1.amazonaws.com
    sudo -u root docker pull 083341655278.dkr.ecr.ap-southeast-1.amazonaws.com/aws-codepipeline-project:latest
fi
sudo -u root docker run -d -p 80:80 --name aws-codepipeline-project 083341655278.dkr.ecr.ap-southeast-1.amazonaws.com/aws-codepipeline-project:latest
