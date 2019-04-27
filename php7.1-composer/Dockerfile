FROM ubuntu:16.04

ENV DEBIAN_FRONTEND=noninteractive
ENV COMPOSER_ALLOW_SUPERUSER=1

# Installing pre-requisites
RUN apt-get update && apt-get install -y --allow-unauthenticated \
        software-properties-common python-software-properties

RUN LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php

RUN apt-get update && apt-get install -y --allow-unauthenticated \
        curl wget zip unzip python-setuptools git python-pip python-dev \
        libffi-dev libssl-dev libxml2-dev libjpeg8-dev zlib1g-dev \
        php7.1 php7.1-cli php7.1-mbstring php7.1-xml

RUN apt-get purge -y apache2 apache2-data apache2-utils

# Installing Composer
RUN curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
RUN php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer
RUN php -v
RUN composer -V