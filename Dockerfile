# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: tblanker <tblanker@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2020/02/14 10:22:04 by tblanker       #+#    #+#                 #
#    Updated: 2020/02/19 16:49:09 by tblanker      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM debian:buster
RUN apt-get update && apt-get upgrade -y && apt-get install -y

RUN	apt install nginx -y
RUN	apt install mariadb-server -y
RUN apt install php php-fpm -y

CMD nginx && tail -f /dev/null
EXPOSE 80