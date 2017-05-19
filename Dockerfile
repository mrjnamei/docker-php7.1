FROM php:7.1-fpm
MAINTAINER mrjnamei@gmail.com
RUN apt-get update &&  apt-get install -y \
      libfreetype6-dev \
      libjpeg62-turbo-dev \
      libmcrypt-dev \
      libpng12-dev \
      libcurl4-gnutls-dev \
       && docker-php-ext-install -j$(nproc) iconv mcrypt \
          && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
          && docker-php-ext-install -j$(nproc) gd \
          && docker-php-ext-install pdo pdo_mysql \
          && docker-php-ext-install curl \
          && pecl install redis-3.1.2 && docker-php-ext-enable redis \ # redis
          # && pecl install memcached-2.2.0  && docker-php-ext-enable memcached \ # memcached
