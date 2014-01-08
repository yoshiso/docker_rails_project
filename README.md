# Rails Application Container Pattern

This project will work with 3 container.

* mysql container
* rails container
* nginx container



-----------        -----------        -----------
|  nginx  |  <---> |  Rails  |  <-->  |  Mysql  |
-----------        -----------        -----------


## How to use

git clone
cd rails_project

Build containers

```
chmod +x bin/build.sh
bin/build.sh
```

Run containers
```
chmod +x bin/run.sh
bin/run.sh
```

* Access to mysql

mysql -uadmin -pchangeme -h MYSQLIPADRESS

# Access to 