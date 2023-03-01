FROM	alpine:3.16

RUN	apk update; \
	apk add --no-cache nginx openssl; \
	rm -rf /var/cache/apk/*
	
RUN 	mkdir -p /etc/nginx/ssl; \
	openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/OU=42/CN=eleotard.42.fr/UID=eleotard"

RUN	mkdir -p /var/www/html
	
RUN 	chmod 755 /var/www/html; \
 	chown -R nginx:nginx /var/lib/nginx; \
	chown -R nginx:nginx /var/www/html; \ 
	mkdir /etc/nginx/snippets ;\
	cp /etc/nginx/fastcgi_params /etc/nginx/snippets/fastcgi-php.conf


#IMPORTER LA CONFIG NGINX		

COPY	conf/nginx.conf /etc/nginx/nginx.conf

#ECOUTER SUR LE PORT HTTPS PAR DEFAULT

EXPOSE	443

#RUN LE SERVEUR

CMD	["nginx", "-g", "daemon off;"]

