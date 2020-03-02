# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: tblanker <tblanker@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2020/02/14 10:22:04 by tblanker       #+#    #+#                 #
#    Updated: 2020/02/28 15:00:47 by tblanker      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM debian:buster
RUN apt-get update && apt-get upgrade -y && apt-get install -y

RUN	apt-get install nginx -y
RUN	apt-get install mariadb-server -y
RUN apt-get install php php-fpm php-cgi php-cli php-mysql php-json php-mbstring -y
RUN apt-get install wget tar -y

RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.4/phpMyAdmin-4.9.4-english.tar.gz
RUN tar xvf phpMyAdmin-4.9.4-english.tar.gz
RUN mv phpMyAdmin-4.9.4-english/ /usr/share/phpmyadmin
RUN mkdir -p /var/lib/phpmyadmin/tmp
RUN chown -R www-data:www-data /var/lib/phpmyadmin
RUN rm /usr/share/phpmyadmin/config.sample.inc.php
COPY srcs/config.inc.php /usr/share/phpmyadmin

RUN rm -f /etc/nginx/sites-enabled/default
COPY srcs/config /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/config /etc/nginx/sites-enabled/

RUN mkdir var/www/website
COPY srcs/index.php /var/www/website

COPY srcs/startup.sh /

RUN ln -s /usr/share/phpmyadmin /var/www/website

RUN chown -R www-data:www-data /var/www/*
RUN chmod -R 755 /var/www/*

COPY srcs/server.crt /etc/ssl/certs/
COPY srcs/server.key /etc/ssl/private/

CMD bash startup.sh && tail -f /dev/null
EXPOSE 80
EXPOSE 443
