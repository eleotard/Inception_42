#imgs=$(shell docker image ls -aq)


all:
	docker-compose -f srcs/docker-compose.yml up

stop:
	docker-compose -f srcs/docker-compose.yml down

clean:
	docker-compose -f srcs/docker-compose.yml rm
	docker rmi srcs_nginx:latest
	#docker rmi ${imgs}

cnginx:
	docker rm nginx

cmdb:
	docker rm mariadb

cwp:
	docker rm wordpress

re: clean all
