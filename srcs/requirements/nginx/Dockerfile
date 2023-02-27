FROM	debian:buster

RUN	apt-get -y update; \
	apt-get -y install nginx; \
	apt-get -y install vim; \
	apt-get -y install curl; \
	apt-get -y install openssl ; \
	mkdir -p /etc/nginx/ssl; \
	openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/OU=42/CN=eleotard.42.fr/UID=eleotard" 

COPY	conf/nginx.conf /etc/nginx/nginx.conf
