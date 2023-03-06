FROM	debian:buster

RUN	apt update -y; \
	apt upgrade -y; \
	apt-get intall dialog -y; \
	DEBIAN_FRONTEND=noninteractive apt-get install mariadb-server -y

RUN	mkdir /scripts/ 
#	mkdir /run/mysqld; \
#	chmod -R 777 /run/mysqld; \
#	chmod -R 777 /var/lib/mysql

COPY	conf/my.cnf /etc/my.cnf
COPY	tools/script.sh /scripts/script.sh

RUN	chmod +x /scripts/script.sh

ENTRYPOINT ["sh", "/scripts/script.sh"]


