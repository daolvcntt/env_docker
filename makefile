build_base:
	docker-compose -p gobox -f docker-compose-gobox.yml build --no-cache base

build_php:
	docker-compose -p gobox -f docker-compose-gobox.yml build php

build_nginx:
	docker-compose -p gobox -f docker-compose-gobox.yml build nginx

show_all:
	docker-compose -p gobox -f docker-compose-gobox.yml ps

up:
	docker-compose -p gobox -f docker-compose-gobox.yml up -d php nginx

up_php:
	docker-compose -p gobox -f docker-compose-gobox.yml up -d php nginx

down_php:
	docker-compose -p gobox -f docker-compose-gobox.yml down -d php nginx

access_php:
	docker-compose -p gobox -f docker-compose-gobox.yml exec php bash

down:
	docker-compose -p gobox -f docker-compose-gobox.yml down
