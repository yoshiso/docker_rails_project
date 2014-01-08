#!/bin/bash

# Delete Application Container
if docker kill app >> /dev/null && docker rm app >> /dev/null;then
    echo "Delete Container name 'app'"
else
    echo "Faild delete container name 'app'"
fi


DB_IP=$(docker inspect -format="{{ .NetworkSettings.IPAddress }}" mysql)

# Delete Rails DB
sleep 3s
if mysql -uadmin -pchangeme -h $DB_IP -e "use unicorn_sample" >> /dev/null; then
    echo "Database for rails is now deleting"

    mysql -uadmin -pchangeme -h $DB_IP -e "drop database unicorn_sample;"
fi

# Delete Mysql Container
if docker kill mysql >> /dev/null && docker rm mysql >> /dev/null;then
    echo "Delete Container name 'mysql'"
else
    echo "Faild delete container name 'mysql'"
fi