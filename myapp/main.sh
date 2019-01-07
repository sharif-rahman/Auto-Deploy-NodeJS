
#!/bin/bash



BUILDIMAGE="$(docker-compose -f $WORKSPACE/myapp/docker-compose.yml up -d)"
#BUILDIMAGE="$(docker-compose up -d)"
REGISTRY=shariftest
LOCALIMAGE=$(docker-compose images | awk '$1 ~ /shariftest/ { print $2 }')
LOCAL_TAG=$(docker-compose images | awk '$1 ~ /shariftest/ { print $3 }')
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



