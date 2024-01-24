#!/bin/bash

# Aktualizacja repozytoriów i instalacja potrzebnych narzędzi
sudo apt update
sudo apt install -y software-properties-common

# Dodanie repozytorium PHP od Ondřej Surý
sudo add-apt-repository -y ppa:ondrej/php
sudo apt update

# Instalacja PHP 8.0 i niezbędnych rozszerzeń
sudo apt install -y php8.0 libapache2-mod-php8.0 php8.0-gd php8.0-mysql php8.0-curl php8.0-xml php8.0-mbstring php8.0-zip php8.0-json php8.0-bz2 php8.0-intl

# Wyłączenie starej wersji PHP i włączenie nowej
sudo a2dismod php7.4
sudo a2enmod php8.0

# Restart Apache, aby zastosować zmiany
sudo systemctl restart apache2

# Wyświetlenie zainstalowanej wersji PHP
php -v
