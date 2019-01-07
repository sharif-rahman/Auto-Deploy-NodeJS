# Views template layouting

Create the web app

Technologies and tools:

- Dockerfile 
  - Install the npm 
- docker-compose
  - Container creation 
- main.sh
  - runs the docker-compose
  - checks the docker registery login
  - It creates the Tag
  - It pusshed the new images to registery.
  
# RUN the shell script

./main.sh

# Importent Information regards to shell file main.sh
- The Command execution for docker-compose file to create the provided image.

BUILDIMAGE="$(docker-compose -f $WORKSPACE/myapp/docker-compose.yml up -d)"

- The Command execution for docker-compose file to display the image name.

LOCALIMAGE=$(docker-compose -f $WORKSPACE/myapp/docker-compose.yml images | awk '$1 ~ /shariftest/ { print $2 }')

- The Command execution for docker-compose file to display the images Tag.

LOCAL_TAG=$(docker-compose -f $WORKSPACE/myapp/docker-compose.yml images | awk '$1 ~ /shariftest/ { print $3 }')

- The Command execution for docker registery Login.

LOGIN="$(docker login -u shariftest -p 08sharif )"

- The Command execution for docker to create a new tag from the existing one.

TAG="$(docker tag ${LOCALIMAGE}:${LOCAL_TAG}  ${REGISTRY}/${REMOTE_IMAGE}:${REMOTE_TAG} )"

- The Command execution for docker registery push | push the new Tag Images.

PUSH="$(docker push ${REGISTRY}/${REMOTE_IMAGE}:${REMOTE_TAG} )"

