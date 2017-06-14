#!/bin/bash

echo "Europe/Moscow" > /etc/timezone                     
cp /usr/share/zoneinfo/Europe/Moscow /etc/localtime 

# www-data user
usermod -d /var/www/ www-data
chsh -s /bin/bash www-data
chown www-data.www-data /var/www/

chown -R www-data.www-data /var/www/html
chown -R www-data.www-data /var/www/.console

sudo -H -u www-data composer update --with-dependencies -d /var/www/html
