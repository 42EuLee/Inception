NAME		=	derp
RM			=	rm -rf
SRC_PATH	=	srcs


all:
	docker-compose -f srcs/docker-compose.yml build
# docker run --name Yunzhe-oh-wait -i -t nginx /bin/bash

run:
	cd srcs && docker-compose up -d nginx && cd ..
run2:
	cd srcs && docker-compose up -d mariadb && cd ..
run3:
	cd srcs && docker-compose up -d wordpress && cd ..
runall:
	cd srcs && docker-compose up -d && cd .. 

debug:
	docker logs --tail 10 yunzhe-oh`-wait
# cd iwannadie && docker build -t docker .

down:
	cd srcs && docker-compose down --rmi all && cd ..

exec:
	docker exec -it srcs_mariadb_run_1 bash

clean:
	docker system prune -f

fclean: clean
	rm -rf /Users/$(LOGNAME)/data

re: fclean all

.PHONY = all clean fclean re