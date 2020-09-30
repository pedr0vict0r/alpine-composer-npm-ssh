FROM php:7.4.10-fpm-alpine3.12

RUN apk update && apk upgrade
RUN apk add --update nodejs nodejs-npm

RUN curl --silent --show-error https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN php -v
RUN composer -V
RUN npm -v
