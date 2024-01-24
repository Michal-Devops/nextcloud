# nextcloud
step by step command

sudo apt update
sudo apt upgrade

sudo apt install apache2 mysql-server  unzip

sudo apt install php libapache2-mod-php-mysql

sudo apt install php-xml php-cli php-cgi php-gd php-curl php-zip php-mbstring php-json php-bz2 php-intl

 Konfiguracja Bazy Danych MySQL

 sudo mysql

CREATE DATABASE nextcloud;
CREATE USER 'nextclouduser'@'localhost' IDENTIFIED BY 'nimda123';
GRANT ALL PRIVILEGES ON nextcloud.* TO 'nextclouduser'@'localhost';
FLUSH PRIVILEGES;
EXIT;
cd /tmp
wget https://download.nextcloud.com/server/releases/nextcloud-26.0.10.zip
<!-- unzip nextcloud-26.0.10.zip
sudo mv nextcloud /var/www/html/nextcloud -->
unzip nextcloud-26.0.10.zip -d /var/www/html/


sudo chown -R www-data:www-data /var/www/html/nextcloud
sudo chmod -R 755 /var/www/html/nextcloud

Konfiguracja Apache

sudo nano /etc/apache2/sites-available/nextcloud.conf

config 
<VirtualHost *:80>
  DocumentRoot /var/www/html/nextcloud/
  ServerName 192.168.56.10

  <Directory /var/www/html/nextcloud/>
    Require all granted
    AllowOverride All
    Options FollowSymLinks MultiViews

    <IfModule mod_dav.c>
      Dav off
    </IfModule>
  </Directory>
</VirtualHost>


sudo a2ensite nextcloud
sudo a2enmod rewrite
sudo systemctl restart apache2


problem z php na ubuntu 20 

sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt update
sudo apt install php8.0 libapache2-mod-php8.0 php8.0-gd php8.0-mysql php8.0-curl php8.0-xml php8.0-mbstring php8.0-zip php8.0-json php8.0-bz2 php8.0-intl
sudo a2dismod php7.4
sudo a2enmod php8.0
sudo systemctl restart apache2

na wersji ubuntu 20 trzeba instalować inna wersje nextcloud albo podniesc php do 8 albo podniesc system 