FROM	alpine:3.16

RUN	apk update; \
	apk add --no-cache openrc mariadb mariadb-client mariadb-server-utils; \
	rm -rf /var/cache/apk/*

COPY	conf/my.cnf /etc/my.cnf

COPY	conf/script.sh /script.sh

RUN	chmod +x /script.sh

#ENTRYPOINT ["sh", "/script.sh"]

#CMD ["mysqld"]
