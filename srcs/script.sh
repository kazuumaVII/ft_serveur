#!/bin/bash

mv /var/www/wordpress /var/www/html/
mv /var/www/phpmyadmin /var/www/html/

mkdir /etc/nginx/ssl/
mv /home/*.pem /etc/nginx/ssl/

service nginx start
service mysql start
service php7.3-fpm start

rm -f /var/www/html/index.nginx-debian.html

mysql -u root -e "CREATE DATABASE wordpress"
mysql -u root -e "CREATE USER 'frfrance'@'localhost' IDENTIFIED BY 'lupinu7'"
mysql -u root -e "GRANT ALL PRIVILEGES ON * . * TO 'frfrance'@'localhost'"
mysql -u root -e "FLUSH PRIVILEGES"
