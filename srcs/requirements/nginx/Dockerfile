FROM debian:buster

RUN apt-get update && apt-get install -y nginx openssl \
&& openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt \
-subj "/C=RU/ST=AnyState/L=AnyCity/O=AnyOrganization/OU=AnyOrganizationUnit/CN=.ru"
COPY ./default etc/nginx/sites-enabled/default
CMD ["nginx", "-g", "daemon off;"]