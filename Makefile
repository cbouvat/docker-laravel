build:
	docker-compose build

composer-install:
	docker-compose exec php composer install --optimize-autoloader --no-suggest --no-dev

composer-install-dev:
	docker-compose run --rm php composer install

composer-update:
	docker-compose run --rm php composer update

database-migrate:
	docker-compose run --rm php /var/www/artisan migrate --force

database-seed:
	docker-compose run --rm php /var/www/artisan migrate:fresh --seed

down:
	docker-compose exec php /var/www/artisan down --refresh=15

ide-helper:
	docker-compose run --rm php /var/www/artisan ide-helper:eloquent
	docker-compose run --rm php /var/www/artisan ide-helper:generate
	docker-compose run --rm php /var/www/artisan ide-helper:meta
	docker-compose run --rm php /var/www/artisan ide-helper:models --nowrite

git-pull:
	git reset --hard
	git pull origin main

install: build composer-install laravel-storage
install-dev: build composer-install-dev laravel-storage

laravel-install:
	docker-compose run --rm php composer create-project laravel/laravel laravel
	mv README.md README-docker.md
	mv laravel/{*,.*} .
	rm -R laravel

laravel-cache:
	docker-compose exec php /var/www/artisan cache:clear
	docker-compose exec php /var/www/artisan config:cache
	docker-compose exec php /var/www/artisan event:cache
	docker-compose exec php /var/www/artisan route:cache
	docker-compose exec php /var/www/artisan view:cache

laravel-storage:
	docker-compose run --rm php /var/www/artisan storage:link

pull:
	docker-compose pull

restart: stop start

start:
	docker-compose up -d

stop:
	docker-compose down --remove-orphans

tinker:
	docker-compose exec php /var/www/artisan tinker

test:
	docker-compose exec php /var/www/artisan config:clear
	docker-compose exec php /var/www/artisan test

up:
	docker-compose exec php /var/www/artisan up

update: down git-pull build composer-install laravel-cache database-migrate up
update-dev: down git-pull build composer-install-dev database-migrate up
upgrade: stop git-pull pull build composer-install laravel-cache database-migrate start
upgrade-dev: stop git-pull pull build composer-install-dev database-migrate start
