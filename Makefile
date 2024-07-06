.PHONY: all build_nginx build_wordpress up

all: build_nginx build_wordpress up

build_nginx:
	docker build -t nginx ./requirements/nginx

build_wordpress:
	docker build -t wordpress ./requirements/wordpress

up:
	docker-compose -f ./requirements/docker-compose.yml up