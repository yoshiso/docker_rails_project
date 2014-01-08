#!/bin/bash

#Workin directory の取得
cd `/usr/bin/dirname $0`
cd ..
WORKING_DIR=`pwd`

echo "Start building mysqld"
cd "$WORKING_DIR/mysql"
docker build -t yoshiso/rails_project_mysqld .
echo "End building mysqld"

echo "Start building nginx"
cd "$WORKING_DIR/nginx"
docker build -t yoshiso/rails_project_nginx .
echo "End building nginx"

echo "Start building rails"
cd "$WORKING_DIR/rails"
docker build -t yoshiso/rails_project_rails .
echo "End building rails"