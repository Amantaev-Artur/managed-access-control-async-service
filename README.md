# README

Шаги по запуску:

1. Установить (если нет) docker и docker compose

2. Выполнить в консоли
```
cp .env.example .env
# настраиваем переменные при необходимости

docker compose up -d rabbitmq

docker compose up web
```
