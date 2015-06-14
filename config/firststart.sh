#!/bin/bash

password=$4
timezone=$6

# Set up Debian
echo -e "$password\n$password" | passwd
echo deb http://ftp.us.debian.org/debian/ sid main \ > /etc/apt/sources.list.d/sid.list
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get -y upgrade
echo $timezone > /etc/timezone
dpkg-reconfigure --frontend noninteractive tzdata

# Install git, vim, nodejs, npm
apt-get -y install git vim nodejs npm

# Install Apache
apt-get -y install apache2 libapache2-mod-python
echo "ServerName localhost" >> /etc/apache2/apache2.conf
cp /vagrant/config/apache2_vhost /etc/apache2/sites-available/000-default.conf
a2enmod rewrite
mkdir /vagrant/logs
touch /vagrant/logs/apache.log
rm -rf /var/www/html

# Install PHP
sudo apt-get install -y php5 php5-xdebug php5-gd php5-mcrypt php5-curl php5-imap
sed -i '/;sendmail_path =/c sendmail_path = "/usr/bin/sendmail -t -i"' /etc/php5/apache2/php.ini
sed -i '/display_errors = Off/c display_errors = On' /etc/php5/apache2/php.ini
sed -i '/error_reporting = E_ALL & ~E_DEPRECATED/c error_reporting = E_ALL | E_STRICT' /etc/php5/apache2/php.ini
sed -i '/html_errors = Off/c html_errors = On' /etc/php5/apache2/php.ini
echo "zend_extension = /usr/local/lib/php/extensions/no-debug-non-zts-20090626/xdebug.so" >> /etc/php5/apache2/php.ini
echo "date.timezone =" $timezone >> /etc/php5/apache2/php.ini
#echo "error_log = /vagrant/php.log" >> /etc/php5/apache2/php.ini

# Install Composer
curl -s https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

# Install MailDev
apt-get -y install esmtp
echo "hostname=0.0.0.0:1025" > /etc/esmtprc
ln -s /usr/bin/esmtp /usr/bin/sendmail
npm install -g maildev
ln -s /usr/bin/nodejs /usr/bin/node
npm install -g forever
npm install -g forever-service
forever-service install maildev --script /usr/local/lib/node_modules/maildev/bin/maildev
service maildev start

# Install MySQL
debconf-set-selections <<< "mysql-server mysql-server/root_password password $password"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $password"
apt-get -y install mysql-server php5-mysql

# Install PhpMyAdmin
debconf-set-selections <<< "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2"
debconf-set-selections <<< "phpmyadmin phpmyadmin/dbconfig-install boolean true"
debconf-set-selections <<< "phpmyadmin phpmyadmin/app-password-confirm password $password"
debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/admin-pass password $password"
debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/app-pass password $password"
apt-get -y install phpmyadmin

# Install Apaxy
rm -rf /var/www/apaxy/
rm -f /var/www/.htaccess
git clone https://github.com/thdoteo/Apaxy.git /var/www/apaxy-temp
mv /var/www/apaxy-temp/apaxy /var/www/apaxy
mv /var/www/apaxy-temp/.htaccess /var/www/.htaccess
rm -rf /var/www/apaxy-temp/

# Restart Apache
service apache2 restart