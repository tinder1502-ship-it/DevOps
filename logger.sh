#!/bin/bash

# Создаем директорию, если она вдруг удалена
mkdir -p /opt/app

while true
do
  # Генерируем случайную строку до 20 символов
  RANDOM_STR=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 20 | head -n 1)
  
  # Записываем в файл с новой строки
  echo "$RANDOM_STR" >> /opt/app/log.txt
  
  # Пауза 17 секунд
  sleep 17
done