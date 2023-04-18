# syntax=docker/dockerfile:1

FROM debian:buster

RUN mkdir -p /app

WORKDIR /app

RUN apt-get -y update

RUN apt install -y mariadb-server

COPY tools ./tools

RUN chmod +x ./tools/sql_script.sh
# CMD ["/bin/bash", "-l"]

# ENTRYPOINT	["./tools/sql_script.sh"]

CMD ["./tools/sql_script.sh"]



