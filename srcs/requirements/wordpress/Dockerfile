# syntax=docker/dockerfile:1

FROM debian:buster

RUN mkdir -p /app

RUN apt-get -y update

RUN apt-get -y install curl

RUN apt install -y php php-mysql php-fpm wget php-gd

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

# RUN wp core download --path=wpdemo.test --locale=it_IT --allow-root

COPY tools ./tools

RUN chmod +x /tools/wordpress_script.sh

ENTRYPOINT ["/tools/wordpress_script.sh"]

CMD ["/usr/sbin/php-fpm7.3", "-F"]

