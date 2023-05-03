# syntax=docker/dockerfile:1

# Start your image with a node base image
FROM debian:buster


# Create an application directory
RUN mkdir -p /app

# Set the /app directory as the working directory for any command that follows
WORKDIR /app

RUN apt-get -y update

RUN apt install -y nginx

RUN apt install -y ufw
RUN apt-get install openssl


COPY ./conf/default.conf /etc/nginx/conf.d/
COPY ./conf/localhost.conf /app/
COPY ./tools/index.html /usr/share/nginx/html

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout localhost.key -out localhost.crt -config /app/localhost.conf

RUN cp localhost.crt /etc/ssl/certs/localhost.crt
RUN cp localhost.key /etc/ssl/private/localhost.key

EXPOSE 443

# VOLUME /var/www/html/wordpress/

CMD ["nginx", "-g", "daemon off;"]