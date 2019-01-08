# APP Information

- DockerfilesInfo/Dockerfile-jenkinsIMG: 
  - This files create the jenkins Image.

# Jenkins image Creation steps to be follow
- cp DockerfilesInfo/Dockerfile-jenkinsIMG Dockerfile
- docker build -t Image-name .
- docker  run -d --name jenkins-docker -p 8080:8080  -v /var/run/docker.sock:/var/run/docker.sock Image-name

# DockerfilesInfo/Dockerfile-NODEJS: 
  - This file is to create the node application. 
  - Just RUN the main.sh file it will auto  create the docker cotainer with running json application and even it push the images to provide dockerHUB.
- Run the myapp/main.sh 
