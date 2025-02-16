#!/bin/bash
echo "
██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗     ██╗███╗   ██╗ ██████╗     ██████╗ ██╗  ██╗██████╗
██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     ██║████╗  ██║██╔════╝     ██╔══██╗██║  ██║██╔══██╗
██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     ██║██╔██╗ ██║██║  ███╗    ██████╔╝███████║██████╔╝
██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     ██║██║╚██╗██║██║   ██║    ██╔═══╝ ██╔══██║██╔═══╝
██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗██║██║ ╚████║╚██████╔╝    ██║     ██║  ██║██║     ██╗██╗██╗
╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝     ╚═╝     ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝

"
rm apt.gpg
apt-get update
apt install -y curl wget gnupg2 ca-certificates lsb-release apt-transport-https
wget https://packages.sury.org/php/apt.gpg
apt-key add apt.gpg
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list
apt update
apt-get install -y \
    php8.4 \
    php8.4-common \
    php8.4-mysql \
    php8.4-mbstring \
    php8.4-mcrypt \
    php8.4-curl \
    php8.4-xml \
    php8.4-zip \
    php8.4-gd \
    php8.4-bcmath

apt-get install composer -y

chmod -R 777 storage/logs/

php artisan config:clear
php artisan cache:clear
php artisan view:clear
