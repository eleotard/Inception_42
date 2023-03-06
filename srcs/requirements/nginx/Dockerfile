FROM	debian:buster

RUN	apt update && apt upgrade -y; \
	apt-get install nginx -y; \
	apt-get install openssl -y 
	
RUN 	mkdir -p /etc/nginx/ssl; \
	openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/OU=42/CN=eleotard.42.fr/UID=eleotard"
	
RUN 	chmod 755 /var/www/html; \

#IMPORTER LA CONFIG NGINX		

COPY	conf/nginx.conf /etc/nginx/nginx.conf

#ECOUTER SUR LE PORT HTTPS PAR DEFAULT

EXPOSE	443

#RUN LE SERVEUR

CMD	["nginx", "-g", "daemon off;"]

