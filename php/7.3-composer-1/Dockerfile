FROM php:7.3-fpm

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
  procps \
  iputils-ping

RUN docker-php-ext-configure \
  gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/

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
  && pecl install xdebug-3.1.5 \
  && docker-php-ext-enable xdebug

RUN pecl install redis \
  && docker-php-ext-enable redis

RUN apt-get install -y libmagickwand-dev \
  && pecl install imagick  \
  && docker-php-ext-enable imagick

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

RUN install-php-extensions ioncube_loader sourceguardian

ARG UID
ARG IS_ARM

RUN apt update --fix-missing && apt install -y wget
COPY --from=common get_sendmail.sh .
RUN chmod +x get_sendmail.sh
RUN ./get_sendmail.sh

COPY --from=composer:1 /usr/bin/composer /usr/bin/composer

RUN adduser -u ${UID} --disabled-password --gecos "" appuser
RUN mkdir /home/appuser/.ssh
RUN echo "StrictHostKeyChecking no" >> /home/appuser/.ssh/config
RUN echo "export COLUMNS=300" >> /home/appuser/.bashrc
COPY --from=common .bash_aliases /home/appuser
RUN chown -R appuser:appuser /home/appuser/

COPY --from=common php.ini ${PHP_INI_DIR}/php.ini
COPY --from=common xdebug.ini ${PHP_INI_DIR}/conf.d/xdebug.ini

USER appuser
RUN composer global require "hirak/prestissimo" && composer clear-cache

WORKDIR /usr/share/nginx/html
