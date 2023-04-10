FROM php:8.1-fpm

ENV COMPOSER_ALLOW_SUPERUSER 1

RUN apt-get update && apt-get install -y git libzip-dev zip unzip supervisor libpng-dev libjpeg-dev && \
    curl -sS https://getcomposer.org/installer -o composer-setup.php && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
    rm -rf composer-setup.php

# add mysql driver
RUN docker-php-ext-install pdo_mysql opcache

# Add gd
RUN docker-php-ext-configure gd --with-jpeg && docker-php-ext-install gd

# Add zip bcmath
RUN docker-php-ext-install zip bcmath

WORKDIR /app

ADD ./gobox/api/composer.lock /app/composer.lock
ADD ./gobox/api/composer.json /app/composer.json