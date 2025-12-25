Шаг 1: Подготовка инфраструктуры
создаю рабочую директорию и файл лога в системном разделе /opt, а также настраиваю права доступа.

Bash

# Создаю папку для приложения
sudo mkdir -p /opt/app

# Создаю файл лога
sudo touch /opt/app/log.txt

# Разрешаем запись в файл 
sudo chmod 666 /opt/app/log.txt
Шаг 2: Написание Bash-скрипта
Создаю файл logger.sh. 

Bash

#!/bin/bash

# Бесконечный цикл
while true
do
  # Генерация случайной строки из букв и цифр длиной до 20 символов
  RANDOM_STR=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 20 | head -n 1)
  
  # Запись строки в конец файла log.txt
  echo "$RANDOM_STR" >> /opt/app/log.txt
  
  # Ожидание 17 секунд перед следующей итерацией
  sleep 17
done
делаю скрипт исполняемым: chmod +x logger.sh.

Шаг 3: Настройка автозагрузки через Systemd

Создаю файл сервиса: sudo nano /etc/systemd/system/mylogger.service


[Unit]
Description=Random String Logger Service
After=network.target

[Service]
Type=simple
ExecStart=/bin/bash /полный/путь/к/скрипту/logger.sh
Restart=always

[Install]
WantedBy=multi-user.target
Активируем сервис:

Bash

sudo systemctl daemon-reload
sudo systemctl enable mylogger
sudo systemctl start mylogger
Шаг 4: Настройка ротации логов (Logrotate)
Чтобы файл /opt/app/log.txt не занял всё место на диске, настроим его автоматическую очистку.

Создание конфиг: sudo nano /etc/logrotate.d/myapp


Plaintext

/opt/app/log.txt {
    daily          # Проверять ежедневно
    rotate 7       # Хранить 7 старых копий
    compress       # Сжимать старые логи
    missingok      # Не выдавать ошибку, если файла нет
    notifempty     # Не вращать пустой файл
}
Шаг 5: Проверка результата
Проверка что все работает:

Bash

tail -f /opt/app/log.txt

