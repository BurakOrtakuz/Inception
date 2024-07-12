#!/bin/bash

service mariadb start

sleep 3

mariadb -e "CREATE DATABASE IF NOT EXISTS exampledb;"
mariadb -e "SELECT 1 FROM mysql.user WHERE User = 'exampleuser';" | grep -q 1 || mariadb -e "CREATE USER 'exampleuser'@'%' IDENTIFIED BY 'examplepass';"
mariadb -e "GRANT ALL PRIVILEGES ON exampledb.* TO 'exampleuser'@'%';"
mariadb -e "FLUSH PRIVILEGES;"
mariadb -e "SHUTDOWN;"

exec "$@"