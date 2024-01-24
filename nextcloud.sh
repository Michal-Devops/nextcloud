#!/bin/bash

echo "Rozpoczynanie instalacji i konfiguracji Nextcloud..."

# Aktualizacja systemu
sudo apt update
sudo apt upgrade -y

# Instalacja Apache, MySQL i narzędzi pomocniczych
sudo apt install -y apache2 mysql-server unzip

# Instalacja PHP i wymaganych rozszerzeń
sudo apt install -y php libapache2-mod-php php-mysql
sudo apt install -y php-xml php-cli php-cgi php-gd php-curl php-zip php-mbstring php-json php-bz2 php-intl

# Konfiguracja Bazy Danych MySQL
echo "Konfiguracja bazy danych MySQL..."
sudo mysql -e "CREATE DATABASE nextcloud;"
sudo mysql -e "CREATE USER 'nextclouduser'@'localhost' IDENTIFIED BY 'nimda123';"
sudo mysql -e "GRANT ALL PRIVILEGES ON nextcloud.* TO 'nextclouduser'@'localhost';"
sudo mysql -e "FLUSH PRIVILEGES;"

# Pobranie i rozpakowanie Nextcloud
echo "Pobieranie i instalacja Nextcloud..."
cd /tmp
wget https://download.nextcloud.com/server/releases/nextcloud-26.0.10.zip
unzip nextcloud-26.0.10.zip -d /var/www/html/

# Nadawanie uprawnień
sudo chown -R www-data:www-data /var/www/html/nextcloud
sudo chmod -R 755 /var/www/html/nextcloud

# Konfiguracja Apache
echo "Konfiguracja Apache..."
sudo bash -c 'cat > /etc/apache2/sites-available/nextcloud.conf <<EOF
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
EOF'

# Aktywacja konfiguracji i restart Apache
sudo a2ensite nextcloud
sudo a2enmod rewrite
sudo systemctl restart apache2

echo "Instalacja i konfiguracja Nextcloud zakończona."
