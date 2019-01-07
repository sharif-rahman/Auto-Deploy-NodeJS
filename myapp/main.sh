
#!/bin/bash



BUILDIMAGE="$(docker-compose -f $WORKSPACE/myapp/docker-compose.yml up -d)"
#BUILDIMAGE="$(docker-compose up -d)"
REGISTRY=shariftest
#LOCALIMAGE=$(sudo docker-compose images | awk '$1 ~ /shariftest/ { print $2 }')
LOCALIMAGE=myapp_app
#LOCAL_TAG=$(sudo docker-compose images | awk '$1 ~ /shariftest/ { print $3 }')
LOCAL_TAG=latest
REMOTE_IMAGE=test
REMOTE_TAG=04


LOGIN="$(docker login -u shariftest -p 08sharif )"
TAG="$(docker tag ${LOCALIMAGE}:${LOCAL_TAG}  ${REGISTRY}/${REMOTE_IMAGE}:${REMOTE_TAG} )"

PUSH="$(docker push ${REGISTRY}/${REMOTE_IMAGE}:${REMOTE_TAG} )"

if [ $? -eq 0 ]; then

   echo "DOCKER REGISTRY $LOGIN "
   echo "DOCKER REGISTRY $TAG  $$PUSH "> /dev/null

if [ $? -eq 0 ]; then

   echo " DOCKER REGISTRY IMAGES PUSH Succeeded"

else

  echo "DOCKER REGISTRY IMAGES PUSH Not Succeeded"

fi
fi



