FROM php:7.4-fpm

# istall library
RUN apt-get update && apt-get install -y \
    zlib1g-dev \
    libzip-dev \
    unzip \
    git

# install library docker
RUN docker-php-ext-configure gd --with-freetype --with-jpeg --with-png \
    && docker-php-ext-install -j$(nproc) gd zip

# install composer
RUN apt-get update && apt-get -y --no-install-recommends install git \
    && php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer \
    && rm -rf /var/lib/apt/lists/* \
    && composer global require hirak/prestissimo

# install npm
RUN apt-get install -y curl \
    && curl -sL https://deb.nodesource.com/setup_12.x | bash - \
    && apt-get install -y nodejs \
    && curl -L https://www.npmjs.com/install.sh | sh
