# APP Information

##$ DockerfilesInfo/Dockerfile-jenkinsIMG: Jenkins image Creation steps to be follow
```
cp DockerfilesInfo/Dockerfile-jenkinsIMG Dockerfile
docker build -t Image-name .
docker container run -d --restart unless-stopped --name docker-jenkins -p 8080:8080  -v /var/run/docker.sock:/var/run/docker.sock docker-jenkins
```

### DockerfilesInfo/Dockerfile-NODEJS: 
  - This file is to create the node application. 
  - Just RUN the main.sh file it will auto  create the docker cotainer with running json application and even it push the images to provide [DOCKER-HUB] (https://cloud.docker.com/repository/list). Docker ID: shariftest
```
./myapp/main.sh
```
## jenkins-build.sh
- This bash script will modify the version tag, container name, & image name as follows.

Output:
```
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                               NAMES
368830dd102c        myapp_app           "node app.js"            35 minutes ago      Up 35 minutes       0.0.0.0:3000->3000/tcp              greentube
e769eba545bc        docker-jenkins      "/sbin/tini -- /us..."   19 hours ago        Up 19 hours         0.0.0.0:8080->8080/tcp, 50000/tcp   docker-jenkins
```
