#! /usr/bin/env bash
IMAGE_NAME=ouster-img
CONTAINER_NAME=ouster-container

docker build -t $IMAGE_NAME .
xhost +
nvidia-docker run -it --rm -v /tmp/.X11-unix:/tmp/.X11-unix -v `pwd`/bag_files:/root/bag_files -e DISPLAY --name $CONTAINER_NAME --privileged --net host $IMAGE_NAME
xhost -