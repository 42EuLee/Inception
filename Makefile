NAME		=	derp
RM			=	rm -rf
MKDIR		=	mkdir -p
SRC_PATH	=	srcs


all:
	docker-compose -f srcs/docker-compose.yml build
# docker run --name Yunzhe-oh-wait -i -t nginx /bin/bash

run:
	cd srcs && docker-compose run -p 443:443 nginx  && cd ..
run2:
	cd srcs && docker-compose run -p 443:443 mariadb  && cd ..

debug:
	docker logs --tail 10 yunzhe-oh`-wait
# cd iwannadie && docker build -t docker .

down:
	cd srcs && docker-compose down && cd ..

exec:
	docker exec -it srcs_mariadb_run_1 bash

clean:
	docker system prune -f

fclean:
	docker rm `docker ps -a -q`

# re: fclean all

# .PHONY = all clean fclean re