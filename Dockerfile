# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: tblanker <tblanker@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2020/02/14 10:22:04 by tblanker       #+#    #+#                 #
#    Updated: 2020/02/26 13:53:14 by tblanker      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM debian:buster
RUN apt-get update && apt-get upgrade -y && apt-get install -y

RUN	apt install nginx -y
#RUN apt install service -y
RUN	apt install mariadb-server -y
RUN apt install php php-fpm php-cgi php-cli php-mysql php-json php-mbstring -y
RUN /etc/init.d/php7.3-fpm start
RUN rm -f /etc/nginx/sites-enabled/default
COPY srcs/pis.php /var/www/html
COPY srcs/config /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/config /etc/nginx/sites-enabled/
RUN chown -R www-data:www-data /var/www/*
RUN chmod -R 755 /var/www/*
CMD nginx && tail -f /dev/null
EXPOSE 80