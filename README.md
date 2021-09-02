# Docker Laravel

## 🚫 Requirement

- Docker engine 19.03.0+
- Docker Compose 1.27+
- Make

## 🛠 Build with

- HTTP server Nginx 1.20
- PHP 8 with Framework Laravel
- Node 16
- Database PostgreSQL 13

## 📖 Install Laravel

Many commands are in `Makefile` file. Example `start`, `stop`, `build` and [many more 👇](#-list-of-commands).

- It is not recommended to clone or fork the repository, download a copy of this Git repository
- Run this command `make laravel-install` for install Laravel with Composer
- **⚠️ Modify** environnement file `.env` create by Laravel installer with this :

```bash
DB_CONNECTION=pgsql
DB_HOST=pgsql
DB_PORT=5432
DB_DATABASE=Change this
DB_USERNAME=Change this
DB_PASSWORD=Change this

MAIL_MAILER=smtp
MAIL_HOST=mailhog
MAIL_PORT=1025
MAIL_USERNAME=null
MAIL_PASSWORD=null
MAIL_ENCRYPTION=null
MAIL_FROM_ADDRESS=null
MAIL_FROM_NAME="${APP_NAME}"
```

- Launch the environment with `make start-dev`
- And enjoy 😊 !

## 🧰 Development environment

This command build container, install composer dependencies.

`make install-dev`

Start environment.

`make start-dev`

### Development tools

#### Xdebug

For Visual Studio Code, use this configuration in `.vscode/launch.json` file.

```json
{
    "name": "Xdebug listen",
    "type": "php",
    "request": "launch",
    "port": 9003,
    "stopOnEntry": true,
    "pathMappings": {
        "/app": "${workspaceFolder}"
    }
}
```

#### Database management tool

Adminer equivalent to PHPmyAdmin. All credentials are in `.env` file.

`http://localhost:8080`

#### Mail capture

MailHog capture all mails form the application.

`http://localhost:8025`

## 💼 Production environment

### First launch

- **Modify** ⚠️ environnement file `.env` with production parameters
- `make install`
- `make start`

## 📚 List of commands

- `build` : Build docker container
- `build-dev` : Build docker development container
- `composer-install` : Install PHP dependencies with Composer for production
- `composer-install-dev` : Install PHP dependencies with Composer for devellopement
- `composer-update` : Update PHP dependencies
- `database-migrate` : Laravel database migration command
- `database-seed` : Laravel database seeding command
- `down` : Set in maintenance Laravel application
- `ide-helper` : Generate helpers file for IDE (PHPStorm, VS Code ...)
- `git-pull` : Reset stage and git pull
- `install` : Run `build`, `composer-install` `laravel-storage`
- `install-dev` : Run `build-dev`, `composer-install-dev` `laravel-storage`
- `laravel-install` : Install Laravel with Composer
- `laravel-cache` : Generate all cache for Laravel
- `laravel-storage` : Create store link for Laravel
- `pull` : Pull the lastest Docker containers
- `restart` : Restart Docker containers
- `restart-dev` : Restart Docker development containers
- `start` : Start Docker containers
- `start-dev` : Start Docker development containers
- `stop` : Stop Docker containers
- `stop-dev` : Stop Docker development containers
- `tinker` : Run Laravel Tinker
- `test` : Run Laravel unit test
- `test-create name=TestName` : Create run Laravel unit test
- `up` : Set online Laravel application
- `update` : Run `down` `git-pull` `composer-install` `laravel-cache` `database-migrate` `up`
- `update-dev` : Run `down` `git-pull` `composer-install-dev` `database-migrate` `up`
- `upgrade` : Run `stop` `git-pull` `pull` `build` `composer-install` `laravel-cache` `database-migrate` `start`
- `upgrade-dev` : Run `stop` `git-pull` `pull-dev` `build-dev` `composer-install-dev` `database-migrate` `start`
