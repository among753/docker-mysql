#!/bin/sh

TAG="mysql"

USER="admin"

PORT=$1

CONTAINER_ID=$(docker ps | grep $TAG | awk '{print $1}')

IP=$(docker inspect $CONTAINER_ID | python -c 'import json,sys;obj=json.load(sys.stdin);print obj[0]["NetworkSettings"]["IPAddress"]')

#mysql -u $USER -p -h $IP

# boot2docker
mysql -u $USER -p -h 127.0.0.1 -P $PORT
