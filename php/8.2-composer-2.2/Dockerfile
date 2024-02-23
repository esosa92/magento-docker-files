FROM php:8.2-fpm

RUN apt-get update && apt-get install -y \
  cron \
  git \
  gzip \
  libbz2-dev \
  libfreetype6-dev \
  libicu-dev \
  libjpeg62-turbo-dev \
  libmcrypt-dev \
  libonig-dev \
  libwebp-dev \
  libpng-dev \
  libxpm-dev \
  libsodium-dev \
  libssh2-1-dev \
  libxslt1-dev \
  libzip-dev \
  lsof \
  default-mysql-client \
  vim \
  zip \
  procps

RUN docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp

RUN docker-php-ext-install \
  bcmath \
  bz2 \
  calendar \
  exif \
  gd \
  gettext \
  intl \
  mbstring \
  mysqli \
  opcache \
  pcntl \
  pdo_mysql \
  soap \
  sockets \
  sodium \
  sysvmsg \
  sysvsem \
  sysvshm \
  xsl \
  zip

RUN pecl channel-update pecl.php.net \
  && pecl install xdebug \
  && docker-php-ext-enable xdebug

RUN pecl install redis \
  && docker-php-ext-enable redis

RUN apt-get install --fix-missing -y libmagickwand-dev \
  && pecl install imagick  \
  && docker-php-ext-enable imagick

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/
RUN install-php-extensions

ARG UID
ARG IS_ARM

RUN apt update && apt install -y pv iputils-ping

RUN apt update --fix-missing && apt install -y wget
COPY --from=common get_sendmail.sh .
RUN chmod +x get_sendmail.sh
RUN ./get_sendmail.sh
#also RUN /bin/bash get_sendmail.sh would by the same that replacing the 2 previous lines

#Here instead of installing composer via wget and what not
#I add an special flag that let's me copy a folder inside an image
#The composer image already has composer installed
#So I'm actually doing from composer:2 /user/bin/composer to this image file system
COPY --from=composer:2.2 /usr/bin/composer /usr/bin/composer
RUN adduser -u ${UID} --disabled-password --gecos "" appuser
RUN mkdir /home/appuser/.ssh
RUN echo "StrictHostKeyChecking no" >> /home/appuser/.ssh/config
RUN echo "export COLUMNS=300" >> /home/appuser/.bashrc
COPY --from=common .bash_aliases /home/appuser
RUN chown -R appuser:appuser /home/appuser/

COPY --from=common php.ini ${PHP_INI_DIR}/php.ini
COPY --from=common xdebug.ini ${PHP_INI_DIR}/conf.d/xdebug.ini

ENV M2_ROOT_FOLDER="/m2"
RUN mkdir /m2

USER appuser

SHELL ["/bin/bash", "-c"]
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
RUN touch ~/.bashrc && chmod +x ~/.bashrc
RUN . ~/.nvm/nvm.sh && source ~/.bashrc && nvm install node

RUN curl -sS https://accounts.magento.cloud/cli/installer | php
RUN export PATH=$PATH:$HOME/.magento-cloud/bin

WORKDIR /m2
