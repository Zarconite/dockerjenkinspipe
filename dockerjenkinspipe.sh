#!/bin/bash
if sudo docker ps -a | grep spring-boot
then
sudo docker stop spring-boot-hello-world
sudo docker rm spring-boot-hello-world
sudo docker rmi spring-boot-hello-world
fi
if [ ! -d ~/spring-boot-hello-world ]; then
#rm -rf spring-boot-hello-world/
git clone https://github.com/Zarconite/spring-boot-hello-world
else
git pull https://github.com/Zarconite/spring-boot-hello-world
fi
cd spring-boot-hello-world
mvn clean package
sudo docker build -t spring-boot-hello-world:latest .
sudo docker run -d -p 9000:9000 --name spring-boot-hello-world spring-boot-hello-world