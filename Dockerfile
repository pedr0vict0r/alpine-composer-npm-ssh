FROM php:7.4.10-fpm-alpine3.12

RUN apk update && apk upgrade
RUN apk add --update nodejs nodejs-npm

RUN apk add --no-cache \
    freetype \
    libpng \
    libjpeg-turbo \
    freetype-dev \
    libpng-dev \
    libjpeg-turbo-dev \
    && docker-php-ext-configure gd \
    --with-freetype \
    --with-jpeg \ 
    && NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) && \
    docker-php-ext-install -j${NPROC} gd && \
    apk del --no-cache freetype-dev libpng-dev libjpeg-turbo-dev

RUN curl --silent --show-error https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
