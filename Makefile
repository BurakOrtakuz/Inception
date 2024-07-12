.PHONY: all build_nginx build_wordpress build_mariadb clean fclean stop up

all: file build_nginx build_wordpress build_mariadb up

file:
	rm -rf /home/bortakuz/data
	mkdir /home/bortakuz/data
	mkdir /home/bortakuz/data/mariadb
	mkdir /home/bortakuz/data/wordpress
build_nginx:
	docker build -t nginx ./srcs/requirements/nginx

build_wordpress:
	docker build -t wordpress ./srcs/requirements/wordpress

build_mariadb:
	docker build -t mariadb ./srcs/requirements/mariadb
stop:
	@docker-compose -f srcs/docker-compose.yml stop

clean:
	@docker-compose -f srcs/docker-compose.yml down --volumes

fclean: clean
	@docker system prune -af
	@rm -rf /home/bortakuz/data

up:
	docker-compose -f ./srcs/docker-compose.yml up