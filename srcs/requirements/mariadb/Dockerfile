FROM	alpine:3.16

RUN	apk update; \
	apk add --no-cache openrc mariadb mariadb-client mariadb-server-utils; \
	rm -rf /var/cache/apk/*

RUN	mkdir -p /scripts/

COPY	conf/my.cnf /etc/my.cnf
COPY	tools/script.sh /scripts/script.sh

RUN	chmod +x /scripts/script.sh

ENTRYPOINT ["sh", "/scripts/script.sh"]


