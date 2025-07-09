#!/bin/bash

if [[ $(uname) != 'Linux' ]]; then
  echo 'Script only supports Linux OS'
  exit
fi
echo '=== Проверка зависимостей ==='
if ! [ -x "$(command -v docker)" ]; then
  echo 'Не установлен docker' >&2
  exit 1
fi
if ! [ -x "$(command -v docker compose)" ]; then
  echo 'Не установлен docker compose' >&2
  exit 1
fi
if ! [ -x "$(command -v git)" ]; then
  echo 'Не установлен git' >&2
  exit 1
fi
echo '..... все необходимые модули присутствуют .....'

mkdir ~/kingboostdev/www
echo '~~~~~ ЗАПУСК ОКРУЖЕНИЯ ~~~~~'
cd ~/kingboostdev && docker compose up -d --build && cd ~
echo '~~~~~ ПОДГРУЗКА РЕПОЗИТОРИЯ ~~~~~'
cd ~/kingboostdev/www/ && git clone git@github.com:KingBoost-Git/kingboost_dtv.git .
echo '~~~~~ КОПИРОВАНИЕ КОНФИГОВ ~~~~~'
cp -rf ~/kingboostdev/init/www/ ~/kingboostdev/www/
echo '~~~~~ НАСТРОЙКА ПРОЕКТА ~~~~~'
docker exec -it php74 git config --global --add safe.directory /var/www/html
docker exec -it php74  rm -rf composer.lock
docker exec -it php74 composer install
docker exec -it php74 php system/storage/vendor/bin/phinx migrate
echo '~~~~~ ДОБАВЛЕНИЕ АЛИАСОВ КОММАНД ЗАПУСКА ~~~~~'
echo "alias dup='cd ~/kingboost_for_dev && docker compose up -d --build && cd ~'" >> ~/.bashrc
echo '>>> Добавлен алиас: dup'
echo "alias ddown='cd ~/kingboost_for_dev && docker compose down --remove-orphans && cd ~'" >> ~/.bashrc
echo '>>> Добавлен алиас: ddown'
echo "alias gp='cd ~/kingboost_for_dev/www && git pull && cd ~'" >> ~/.bashrc
echo '>>> Добавлен алиас: gp'
echo "alias php='docker exec -it php74 bash'" >> ~/.bashrc
echo '>>> Добавлен алиас: php'