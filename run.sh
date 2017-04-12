#!/bin/sh

REPO=nothingdocker
IMAGE_NAME=`basename $PWD`
DOCKER_NAME=${1:-boostserver}
docker rm -f $DOCKER_NAME
docker run -d --privileged \
	--name $DOCKER_NAME \
	-v /sys/fs/cgroup:/sys/fs/cgroup:ro \
	-v /data:/data \
	$REPO/$IMAGE_NAME \
	/usr/sbin/init
docker exec -it $DOCKER_NAME bash
