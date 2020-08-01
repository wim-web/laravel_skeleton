up:
	docker-compose up -d nginx php-fpm mysql
build:
	docker-compose build --no-cache --force-rm
stop:
	docker-compose stop
down:
	docker-compose down
restart:
	@make down
	@make up
ps:
	docker-compose ps

mysqld:
	docker-compose exec mysql bash -c 'mysql -uroot -p$$MYSQL_ROOT_PASSWORD'

database:
	docker-compose exec mysql bash -c 'mysql -uroot -p$$MYSQL_ROOT_PASSWORD -e "create database ${arg}"'

work:
	docker-compose run --rm workspace /bin/ash --login
	
ide-helper:
	docker-compose run --rm php php artisan ide-helper:generate
	docker-compose run --rm php php artisan ide-helper:meta
	docker-compose run --rm php php artisan ide-helper:models --nowrite