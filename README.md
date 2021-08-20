# Docker Laravel

## 🛠 Build with

- Docker
  - HTTP server : Nginx
  - Core language : PHP 8
    - Framework Laravel
  - Database : PostgreSQL 13

## 📖 Documentation

🚧 WIP

### Install Laravel
`make laravel-install` 
`make start`

### Update and upgrade

Set application in maintenance mode or shutdown with `update` or `upgrade`, this command pull code, install latest composer dependencies,
update Laravel cache, migrate database and set application online.

`make update` or `make upgrade`

## 🧰 Development environment

You need to have Docker installed on your system. This project use Docker compose, and a `Makefile` for run a development
environment.

This command build container, install composer dependencies, start environment and seed database.

`make install-dev` 
`make start`

## 🛠 Developer tools

### Database management tool

Adminer equivalent to PHPmyAdmin. All credentials are in `.env` file.

`localhost:8080`

### Mail capture

MailHog capture all mails form the application.

`localhost:8025`

## 💼 Production environment

You need to have Docker installed on your system. This project use Docker compose, and a Makefile for run a production
environment.

### First launch

`make install`  
`make start`

