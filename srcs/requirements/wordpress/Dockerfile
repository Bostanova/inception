FROM debian:buster

RUN 	apt-get update && apt-get -y install php7.3 php-fpm php-mysqli curl
COPY 	./www.conf /etc/php/7.3/fpm/pool.d
ADD 	https://ru.wordpress.org/wordpress-5.7.2-ru_RU.tar.gz /var/www/
RUN 	cd /var/www && tar -xzvf wordpress-5.7.2-ru_RU.tar.gz
RUN 	rm -f /var/www/wordpress-5.7.2-ru_RU.tar.gz && rm -f /var/www/wordpress/wp-config-sample.php
COPY 	./wp-config.php ./var/www/wordpress/
RUN 	mkdir ./run/php/
COPY    ./start.sh /
RUN     chmod 777 start.sh
CMD     ./start.sh