#!/bin/sh

if [ ! -d /data/mysql ];then
    sudo mkdir -p /data/mysql
    sudo chown vagrant:vagrant /data/mysql
fi
docker run -d -p 3306:3306 -v /data/mysql:/var/lib/mysql yoshiso/rails_projectmysqld