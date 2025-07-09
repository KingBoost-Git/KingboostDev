### Локальное окружение для KINGBOOST.NET ###

Примечание: сборка предназначена для Linux операционнок (позже добавлю поддержку винды и макосей). Перед запуском добавьте в хост файл адрес локального проекта.

```bash
sudo nano /etc/hosts
```

Добавьте в самый конец файла строку

```
127.0.0.1 kingboost.dev
```

#### *Первый запуск:* ####
```bash
cp -rf ~/kingboostdev/init/first.sh ~/kingboostdev/first.sh \
&& /bin/bash ~/kingboostdev/first.sh \
&& source ~/.bashrc \
&&rm -rf ~/kingboostdev/first.sh
```
#### *Короткие команды консоли (алиасы)* ####

```
dup - Поднимает локальную среду (контейнеры docker)
ddown - Закрывает локальную среду (с удалением контейнеров)
gp - Аналог git pull (обновляет репозиторий проекта)
php - Вход в контейнер php74 (для отладки)
```

#### *Адреса проекта* ####

http://kingboost.local - вебморда проекта

http://kingboost.local/admin - админка (лог: vamhost / пас: 1234)

http://kingboost.local:2308 - PhpMyAdmin