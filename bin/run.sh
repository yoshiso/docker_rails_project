#!/bin/bash

#mysql serverを立ち上げ
if [ ! -d /data/mysql ];then
    sudo mkdir -p /data/mysql
    sudo chown vagrant:vagrant /data/mysql
fi
DB_ID=$(docker run -d -p 3306:3306 -v /data/mysql:/var/lib/mysql -name mysql yoshiso/rails_project_mysqld)
DB_IP=$(docker inspect -format="{{ .NetworkSettings.IPAddress }}" $DB_ID)

# Rails用DBセットアップ
# [fixme] - restrict host.
sleep 3s
if  ! mysql -uadmin -pchangeme -h $DB_IP -e "use unicorn_sample" >> /dev/null; then
    echo "Database for rails is now setuping"

    mysql -uadmin -pchangeme -h $DB_IP -e "grant all on unicorn_sample.* to 'admin'@'%';\
                                           Create database unicorn_sample DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;"
fi


#Railsアプリの立ち上げ
RAILS_ID=$(docker run -d -p 2222 -p 3000 -link mysql:db -name app yoshiso/rails_project_rails)
RAILS_IP=$(docker inspect -format="{{ .NetworkSettings.IPAddress }}" $RAILS_ID)

echo "Application is running port : $RAILS_IP"
echo "Database is running port    : $DB_IP"