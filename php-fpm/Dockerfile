FROM php:7.4-fpm-alpine3.12

RUN apk upgrade --update && apk --no-cache add icu-dev oniguruma-dev

RUN docker-php-ext-install -j$(nproc) intl mbstring pdo_mysql

COPY ./php.ini /usr/local/etc/php/php.ini