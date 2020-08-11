# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: tblanker <tblanker@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2020/02/14 10:22:04 by tblanker      #+#    #+#                  #
#    Updated: 2020/06/10 16:30:43 by tblanker      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM debian:buster
RUN apt-get update && apt-get upgrade -y && apt-get install -y

RUN	apt-get install nginx -y
RUN	apt-get install mariadb-server -y
RUN apt-get install php php-fpm php-cgi php-cli php-mysql php-json php-mbstring -y
RUN apt-get install wget tar curl -y
RUN apt-get install sendmail -y

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

COPY srcs/server.crt /etc/ssl/certs/
COPY srcs/server.key /etc/ssl/private/

RUN wget https://wordpress.org/latest.tar.gz
RUN tar xvf latest.tar.gz
RUN rm /wordpress/wp-config-sample.php
RUN cp -r /wordpress/* /var/www/website
COPY srcs/wp-config.php /var/www/website
RUN rm /etc/php/7.3/fpm/php.ini
COPY srcs/php.ini /etc/php/7.3/fpm/

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN chown -R www-data:www-data /var/www/*
RUN chmod -R 755 /var/www/*

COPY srcs/autoindex.sh /

CMD bash startup.sh && tail -f /dev/null
EXPOSE 80
EXPOSE 443
EXPOSE 110
