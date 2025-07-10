#!/bin/bash

clear

if [[ $(uname) != 'Linux' ]]; then
  echo 'Script only supports Linux OS'
  exit
fi

echo '===== ПРОВЕРКА ЗАВИСИМОСТЕЙ ====='
dep=("docker" "docker compose" "git")
for module in "${dep[@]}"; do
  if ! [ -x "$(command -v $module)" ]; then
    echo "> Не установлен: $module" >&2
    exit 1
  fi
done
echo '..... все необходимые модули присутствуют .....'

# aliases command
declare -A aliases
aliases["dup"]="cd $PWD && docker compose up -d --build && cd $HOME"
aliases["ddown"]="cd $PWD && docker compose down --remove-orphans && cd $HOME"
aliases["gp"]="cd $PWD/www/ && git pull && cd $HOME"
aliases["php"]="docker exec -it php74 bash"

if ! [ -d $PWD/www/ ]; then
  mkdir $PWD/www/
  echo '~~~~~ ЗАГРУЗКА DEV РЕПОЗИТОРИЯ ~~~~~'
  cd $PWD/www/ && git clone git@github.com:KingBoost-Git/kingboost_dtv.git . && cd ..
  echo '~~~~~ КОПИРОВАНИЕ КОНФИГОВ ~~~~~'
  cp -r $PWD/init/www/* $PWD/www/
  echo '~~~~~ РАЗВОРАЧИВАНИЕ ОКРУЖЕНИЯ ~~~~~'
  docker compose up -d --build
  echo '~~~~~ НАСТРОЙКА ПРОЕКТА ~~~~~'
  docker exec -it php74 chown -R www-data:www-data /var/www/html/* > /dev/null
  echo '> назначен пользователь файлов'
  docker exec -it php74 git config --global --add safe.directory /var/www/html > /dev/null
  echo '> установлена safe.directory для git'
  docker exec -it php74 rm -rf composer.lock > /dev/null
  echo '> удален composer.lock'
  docker exec -it php74 composer install
  echo '> выполнена загрузка зависимостей композер'
  docker exec -it php74 php system/storage/vendor/bin/phinx migrate
  echo '> применены миграции'
  docker exec -it php74 chown -R www-data:www-data /var/www/html/* > /dev/null
  echo '> назначен пользователь файлов'
  echo '~~~~~ ДОБАВЛЕНИЕ АЛИАСОВ КОМАНД ЗАПУСКА ~~~~~'
  for alias in ${!aliases[@]}; do
    echo "alias $alias='${aliases[$alias]}'" >> ~/.bash_aliases
    echo "> Добавлен алиас: $alias"
  done
fi