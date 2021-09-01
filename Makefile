build:
	docker-compose -f docker-compose-production.yml build

build-dev:
	docker-compose build

composer-install:
	docker-compose exec php composer install --optimize-autoloader --no-suggest --no-dev

composer-install-dev:
	docker-compose run --rm php composer install

composer-update:
	docker-compose run --rm php composer update

database-migrate:
	docker-compose run --rm php /app/artisan migrate --force

database-seed:
	docker-compose run --rm php /app/artisan migrate:fresh --seed

down:
	docker-compose exec php /app/artisan down --refresh=15

ide-helper:
	docker-compose run --rm php /app/artisan ide-helper:eloquent
	docker-compose run --rm php /app/artisan ide-helper:generate
	docker-compose run --rm php /app/artisan ide-helper:meta
	docker-compose run --rm php /app/artisan ide-helper:models --nowrite

git-pull:
	git reset --hard
	git pull origin main

install: build composer-install laravel-storage

install-dev: build-dev composer-install-dev laravel-storage

laravel-install:
	docker-compose run --rm php composer create-project laravel/laravel laravel --prefer-dist
	mv README.md README-docker.md
	-mv -f ./laravel/* ./laravel/.* ./
	-rm -rf ./laravel

laravel-cache:
	docker-compose exec php /app/artisan cache:clear
	docker-compose exec php /app/artisan config:cache
	docker-compose exec php /app/artisan event:cache
	docker-compose exec php /app/artisan route:cache
	docker-compose exec php /app/artisan view:cache

laravel-storage:
	docker-compose run --rm php /app/artisan storage:link

pull:
	docker-compose -f docker-compose-production.yml pull

pull-dev:
	docker-compose pull

restart: stop start

restart-dev: stop-dev start-dev

start:
	docker-compose -f docker-compose-production.yml up -d

start-dev:
	docker-compose up -d

stop:
	docker-compose -f docker-compose-production.yml down --remove-orphans

stop-dev:
	docker-compose down --remove-orphans

tinker:
	docker-compose exec php /app/artisan tinker

test:
	docker-compose exec php /app/artisan config:clear
	docker-compose exec php /app/artisan test

up:
	docker-compose exec php /app/artisan up

update: down git-pull composer-install laravel-cache database-migrate up

update-dev: down git-pull-dev composer-install-dev database-migrate up

upgrade: stop git-pull pull build composer-install laravel-cache database-migrate start

upgrade-dev: stop-dev git-pull pull-dev build-dev composer-install-dev database-migrate start-dev
