FROM php:7.2-fpm

RUN apt-get update && \
    apt-get install -y nano vim tree git libzip-dev zip gnupg && \
    docker-php-ext-configure zip --with-libzip && \
    docker-php-ext-install zip && \
    docker-php-ext-install pdo_mysql && \
    docker-php-ext-install mysqli && \
    curl -sL https://deb.nodesource.com/setup_8.x | bash && \
    apt-get install nodejs -yq && \
    pecl install xdebug && \
    docker-php-ext-enable xdebug 

RUN curl --silent --show-error https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer
