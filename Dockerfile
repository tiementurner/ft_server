# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: tblanker <tblanker@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2020/02/14 10:22:04 by tblanker       #+#    #+#                 #
#    Updated: 2020/02/14 12:00:31 by tblanker      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM debian:buster
RUN apt-get update && apt-get upgrade -y && apt-get install -y
RUN	apt install nginx -y
RUN dpkg -s nginx
EXPOSE 80