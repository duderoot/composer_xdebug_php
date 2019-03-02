FROM php:7.1.1

RUN apt-get update -yqq
RUN apt-get install -yqq git unzip libmcrypt-dev libpq-dev libcurl4-gnutls-dev libicu-dev libvpx-dev libjpeg-dev libpng-dev libxpm-dev zlib1g-dev libfreetype6-dev libxml2-dev libexpat1-dev libbz2-dev libgmp3-dev libldap2-dev unixodbc-dev libsqlite3-dev libaspell-dev libsnmp-dev libpcre3-dev libtidy-dev

RUN docker-php-ext-install mbstring mcrypt pdo_mysql pdo_sqlite curl json intl gd xml zip bz2 opcache


RUN pecl install xdebug
RUN docker-php-ext-enable xdebug
# Install and run Composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/bin/composer
RUN useradd -ms /bin/bash  deploy
USER deploy
# RUN php composer.phar install
