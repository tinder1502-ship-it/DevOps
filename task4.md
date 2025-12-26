Выполнение задания Task 4
```text
127.0.0.1  app.local

server {
    listen 80;
    server_name app.local;

    location / {
        root /var/www/html;
        index index.html;
    }
}


#!/bin/bash

# Проверяем, передан ли адрес ресурса в качестве аргумента
if [ -z "$1" ]; then
  echo "Ошибка: не указан адрес ресурса."
  echo "Использование: $0 <url>"
  exit 1
fi

TARGET_URL=$1

# Выполняем запрос:
# --silent (не выводить лишний текст)
# --head (запрашивать только заголовки)
# --fail (возвращать код ошибки, если HTTP статус >= 400)
if curl --silent --head --fail "$TARGET_URL" > /dev/null; then
  echo "Успешно: ресурс $TARGET_URL доступен."
  exit 0
else
  echo "Ошибка: ресурс $TARGET_URL недоступен."
  exit 1
fi

./check_app.sh [http://app.local](http://app.local)
