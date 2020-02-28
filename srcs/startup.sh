#!/bin/bash

nginx

/etc/init.d/php7.3-fpm start

/etc/init.d/mysql start

mysql -e "CREATE DATABASE TEST"
mysql -e "CREATE USER 'admin'@'%' IDENTIFIED BY 'password'"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION"
mysql -e "FLUSH PRIVILEGES;"
mariadb < /usr/share/phpmyadmin/sql/create_tables.sql
