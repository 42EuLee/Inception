# syntax=docker/dockerfile:1

FROM debian:buster

RUN apt-get -y update

RUN apt install -y mariadb-server

COPY tools ./tools

RUN chmod +x /tools/sql_script.sh

ENTRYPOINT	["/tools/sql_script.sh"]

CMD ["mysqld_safe"]

