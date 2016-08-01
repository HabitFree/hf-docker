FROM wordpress

VOLUME [ "/usr/src/wordpress/wp-content/plugins/wp-accountability", "/usr/src/wordpress/wp-content/themes/wp-hf-theme" ]

COPY disable-canonical-redirects.php /usr/src/wordpress/wp-content/plugins/

COPY wp-cli.yml .

COPY wp-cli.phar .

RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

RUN apt-get update

RUN apt-get install -y mysql-client
