#!/bin/bash

REMOTE_TAG=${VERSION_TAGS}
REMOTE_IMAGE=${IMAGE_NAME}
CONTAINER_NAME=${CONTAINER_NAME}
CURRENT_TAG=$(grep -r "REMOTE_TAG" $WORKSPACE/myapp/main.sh  | awk -F "REMOTE_TAG=" '{print $2}')
CURRENT_IMAGE=$(grep -r "REMOTE_IMAGE" $WORKSPACE/myapp/main.sh  | awk -F "REMOTE_IMAGE=" '{print $2}')
current_container_name=$(grep -r "container_name" $WORKSPACE/myapp/docker-compose.yml  | awk -F "container_name: " '{print $2}')
if [ "${REMOTE_TAG}" != "${CURRENT_TAG}" ] ; then
   sed -i "s/${CURRENT_TAG}/${REMOTE_TAG}/g" $WORKSPACE/myapp/main.sh
   echo "Add New Tag:${REMOTE_TAG}"
else
   echo "Same Tag"
fi
if [ "${REMOTE_IMAGE}" != "${CURRENT_IMAGE}" ] ; then
   sed -i "s/$CURRENT_IMAGE/${REMOTE_IMAGE}/g" $WORKSPACE/myapp/main.sh
   echo "Add New Image:${REMOTE_IMAGE}"
else
   echo "Same Image Name"
fi
if [ "${CONTAINER_NAME}" != "${current_container_name}" ]; then
   sed -i "s/${current_container_name}/${CONTAINER_NAME}/g" $WORKSPACE/myapp/docker-compose.yml
   echo "Add New Container:${CONTAINER_NAME}"
else
   echo "Same Container Name"
fi
if [ "${CONTAINER_NAME}" != "${current_container_name}" ]; then
   sed -i "s/shariftesting/${CONTAINER_NAME}/g" $WORKSPACE/myapp/main.sh
   echo "Add New Container:${CONTAINER_NAME}"
else
   echo "Container Error"
fi
