default: help ## Display help

artisan: ## Laravel Artisan command add arg="command" to run a specific command (ex: make artisan arg="migrate")
	docker compose exec php php artisan $(arg)

artisan-migrate: ## Laravel Artisan migrate
	docker compose exec php php artisan migrate

artisan-migrate-fresh: ## Laravel Artisan migrate:fresh
	docker compose exec php php artisan migrate:fresh

artisan-migrate-seed: ## Laravel Artisan migrate:fresh --seed
	docker compose exec php php artisan migrate:fresh --seed

artisan-key-generate: ## Laravel Artisan key:generate
	docker compose exec php php artisan key:generate

artisan-storage:
	docker-compose run --rm php php artisan storage:link

build: ## Build containers
	docker compose build

composer: ## Composer command add arg="command" to run a specific command (ex: make composer arg="require laravel/ui")
	docker compose run --rm php composer $(arg)

composer-install-dev: ## Composer install dev
	docker compose run --rm php composer install

composer-install-prod: ## Composer install prod
	docker compose run --rm php composer install --optimize-autoloader --no-suggest --no-dev

composer-update: ## Composer update
	docker compose run --rm php composer update

copy-env: ## Copy .env.example to .env
	cp .env.example .env

copy-docker-compose-dev: ## Copy docker-compose.dev.yml to docker-compose.yml
	cp docker-compose.dev.yml docker-compose.yml

down: ## Stop and remove all containers
	docker compose down --remove-orphans
	@echo "🛑 Project are stopped and removed"

eslint: ## Run eslint
	docker compose run --rm node npm run eslint

install: copy-docker-compose-dev upgrade laravel-install copy-env up npm-install artisan-key-generate artisan-storage ## Install Project
	@echo "✅ Project is installed and running, edit .env"

git-pull:
	git reset --hard
	git pull origin --no-rebase

help: ## Display this help
	@echo "📖 Project help"
	@echo "✍️ Usage: make [command]"
	@echo "👉 Available commands open Makefile to see all commands"

laravel-install: ## Install Laravel
	docker compose run --rm php composer create-project laravel/laravel laravel --prefer-dist
	mv README.md README-docker.md
	-mv -f ./laravel/* ./laravel/.* ./
	-rm -rf ./laravel

npm: ## Npm command add arg="command" to run a specific command (ex: make npm arg="install")
	docker compose run --rm node npm $(arg)

npm-install: ## Npm install
	docker compose run --rm node npm install

npm-update: ## Npm update
	docker compose run --rm node npm update

up: ## Create and start all containers
	docker compose up -d
	@echo "✅ Project is up and running"

upgrade: pull build ## Upgrade containers (pull and build)

upgrade-dev: down copy-docker-compose-dev upgrade up composer-install-dev npm-install ## Upgrade Project with docker-compose.dev.yml

pint: ## Run Laravel Pint
	docker compose run --rm php ./vendor/bin/pint

pull: ## Pull all containers
	docker compose pull

setup-dev: copy-docker-compose-dev copy-env upgrade composer-install-dev npm-install artisan-key-generate artisan-migrate
	@echo "✅ Project is installed, edit .env and you can now run 'make up' to start containers"
