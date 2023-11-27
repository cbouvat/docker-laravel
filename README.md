# Docker Laravel

## Requirement

- Docker engine
- Docker Compose
- Make

## Build with

- HTTP server Nginx 1.25
- PHP 8.2
- Node 20
- PostgreSQL 16 or MariaDB 11

## Install Laravel

Many commands are in `Makefile` file. Example `up`, `down`, `upgrade` and [many more 👇](#list-of-commands).

- It is not recommended to clone or fork the repository, download a copy of this Git repository and extract it.
- Run this command `make install` for install Laravel with Composer
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

## Development environment

This command build container, install composer dependencies.

`make install`

Start environment.

`make up`

### Development tools

#### Xdebug

For Visual Studio Code, use this configuration in `.vscode/launch.json` file.

```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Listen for Xdebug",
            "type": "php",
            "request": "launch",
            "port": 9003,
            "pathMappings": {
                "/app": "${workspaceFolder}"
            }
        }
    ]
}
```

#### Database 

The database is accessible on port `5432` with this parameters :

- Host : `localhost`
- Port : `5432`

Use for example [DBeaver](https://dbeaver.io/) for connect to the database.

#### Mail capture

MailHog capture all mails form the application.

`http://localhost:8025`

## Production environment

### First launch

- **Modify** ⚠️ environnement file `.env` with production parameters
- `make install`
- `make up`

## List of commands

All commands are in `Makefile` file with description. Open this file for more informations.