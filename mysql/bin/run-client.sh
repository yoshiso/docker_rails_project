#!/bin/sh

TAG="yoshiso/rails_project_mysqld"

CONTAINER_ID=$(docker ps | grep $TAG | awk '{print $1}')

IP=$(docker inspect $CONTAINER_ID | python -c 'import json,sys;obj=json.load(sys.stdin);print obj[0]["NetworkSettings"]["IPAddress"]')

mysql -u admin -p -h $IP