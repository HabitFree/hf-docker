FROM php:7.1

WORKDIR /var/www/html

VOLUME [ "/var/www/html/wp-content/plugins/wp-accountability", "/var/www/html/wp-content/themes/wp-hf-theme" ]

RUN apt-get update; \
    apt-get install -y mysql-client nano

RUN docker-php-ext-install \
    mysqli \
    pdo \
    pdo_mysql

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar; \
    chmod +x wp-cli.phar; \
    mv wp-cli.phar /usr/local/bin/wp; \
    wp core download --path=/var/www/html --allow-root

COPY transfer/php.ini /usr/local/etc/php
COPY transfer/disable-canonical-redirects.php ./wp-content/plugins/
COPY transfer/wp-cli.yml .
COPY transfer/wp-config.php .
COPY transfer/option-sidebar_widgets.txt .

ENV TERM xterm
EXPOSE 80