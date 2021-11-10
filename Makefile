VOLUMES_FOLDER = /home/eerika/data/
WP_VOLUME = /home/eerika/data/wordpress
DB_VOLUME = /home/eerika/data/mariadb

all:
	sudo mkdir -p ${VOLUMES_FOLDER}
	sudo mkdir -p ${WP_VOLUME} ${DB_VOLUME}
	docker-compose -f ./srcs/docker-compose.yml up -d

clean:
	docker-compose -f srcs/docker-compose.yml down

fclean: clean
	docker system prune -a -f
	rm -rf ${VOLUMES_FOLDER}
	docker volume rm $$(docker volume ls -q)
