#!/bin/bash

nginx

/etc/init.d/php7.3-fpm start

/etc/init.d/mysql start

mysql -e "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;"
mysql -e "CREATE USER 'admin'@'%' IDENTIFIED BY 'password'"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION"
mysql -e "FLUSH PRIVILEGES;"
mariadb < /usr/share/phpmyadmin/sql/create_tables.sql

wp core install --url=localhost --title=localhost --admin_user=admin --admin_password=password --admin_email=tiemenr@gmail.com --allow-root --path='/var/www/website';

rm -r /latest.tar.gz /phpMyAdmin-4.9.4-english.tar.gz /wordpress

echo "127.0.0.1 localhost localhost.localdomain $(hostname)" >> /etc/hosts
service sendmail start