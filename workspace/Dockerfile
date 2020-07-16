FROM node:14.2-alpine as node
FROM php:7.4-cli-alpine3.11

RUN apk upgrade --update && apk --no-cache add icu-dev oniguruma-dev && \
    docker-php-ext-install -j$(nproc) intl mbstring pdo_mysql

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN composer config -g repos.packagist composer https://packagist.jp && \
    composer global require hirak/prestissimo

COPY --from=node /usr/local/bin /usr/local/bin
COPY --from=node /usr/local/lib /usr/local/lib

RUN { \
  echo 'alias artisan="php artisan"'; \
  echo 'alias test="./vendor/bin/phpunit"'; \
} >> ~/.profile

