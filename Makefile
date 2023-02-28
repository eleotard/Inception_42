#imgs=$(shell docker image ls -aq)


all:
	docker-compose -f srcs/docker-compose.yml up

nginx:
	docker build -t srcs_nginx srcs/requirements/nginx
	docker run --name nginx -it srcs_nginx

mdb:
	docker build -t srcs_mariadb srcs/requirements/mariadb
	docker run --name mariadb -it srcs_mariadb
	

stop:
	docker-compose -f srcs/docker-compose.yml down

clean:
	docker-compose -f srcs/docker-compose.yml rm
	docker rmi srcs_nginx:latest
	docker rmi srcs_mariadb:latest
	#docker rmi ${imgs}

cnginx:
	docker rm nginx
	docker rmi srcs_nginx

cmdb:
	docker rm mariadb
	docker rmi srcs_mariadb
cwp:
	docker rm wordpress

re: clean all
