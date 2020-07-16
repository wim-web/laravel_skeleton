up:
	docker-compose up -d
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


mysql-e:
	docker-compose exec mysql bash -c 'mysql -u root -p$$MYSQL_ROOT_PASSWORD'

work-e:
	docker-compose run --rm workspace /bin/ash --login
	
ide-helper:
	docker-compose run --rm php php artisan ide-helper:generate
	docker-compose run --rm php php artisan ide-helper:meta
	docker-compose run --rm php php artisan ide-helper:models --nowrite