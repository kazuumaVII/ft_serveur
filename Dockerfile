FROM debian:buster
MAINTAINER francois franceschi <frfrance@student.42.fr>

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y wget \
		&& apt-get install -y nginx \
		&& apt-get install -y mariadb-server mariadb-client \
		&& apt-get install -y php7.3-fpm php7.3-mysql \
		&& apt-get install -y vim 

COPY /srcs/script.sh ./home
COPY /srcs/phpmyadmin var/www/phpmyadmin 
COPY /srcs/wordpress var/www/wordpress
COPY /srcs/default /etc/nginx/sites-available
COPY /srcs/*.pem /home/

RUN chmod 777 ./home/script.sh
CMD bash home/script.sh && bash

EXPOSE 80
EXPOSE 443
