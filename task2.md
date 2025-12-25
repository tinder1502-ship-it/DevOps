# Резюме: Junior DevOps Engineer (Стажер)

> Активно развиваюсь в методологии DevOps. Мой фокус — автоматизация процессов развертывания (CI/CD), инфраструктура как код (IaC) и обеспечение стабильности систем.

---

##  Процесс обучения и стек

На данный момент я нахожусь в процессе активного обучения и практического освоения следующих инструментов:

###  Инфраструктура и автоматизация
ОС:** Глубокое изучение Linux (Ubuntu/CentOS), работа в терминале, написание Bash-скриптов.
Контейнеризация:** * [x] Docker (написание Dockerfile, оптимизация образов)
     [x] Docker Compose (оркестрация локальных окружений)
     [ ] Kubernetes (изучаю основы: Pods, Services, Deployments)
IaC:** Terraform (развертывание базовых ресурсов в облаке).
Конфигурация:** Ansible (написание простых плейбуков).

###  CI/CD & Мониторинг
1. CI/CD: Настройка пайплайнов в GitHub Actions** и **GitLab CI.
2. Мониторинг: Изучение стека Prometheus + Grafana.
3. Логирование: Знакомство с ELK Stack (Elasticsearch, Logstash, Kibana).

---

##  Практические проекты (Pet-projects)

### Автоматизация деплоя веб-приложения
**Стек:** Python (Flask), Docker, GitHub Actions, AWS.
* Настроил автоматическую сборку Docker-образа при каждом push в ветку `main`.
* Реализовал проверку кода (линтеры) перед сборкой.
* Настроил деплой на виртуальную машину через SSH-action.

### Настройка домашней лаборатории
* Развернул локальный сервер на базе Proxmox/VirtualBox.
* Написал Ansible-плейбук для быстрой подготовки среды (установка Docker, Nginx, Git).

---

##  Образование и самоподготовка

| Ресурс / Курс | Направление | Статус |
| :--- | :--- | :---: |
| Практический курс DevOps | CI/CD, Docker, K8s, Terraform | *В процессе* |
| Linux Administration (LPI) | Администрирование систем | Завершено |
| Документация Kubernetes | Изучение архитектуры | *Daily* |



##  Пример Bash-скрипта

Пример простого скрипта для бэкапа базы данных:

```bash
#!/bin/bash
# Скрипт для создания бэкапа PostgreSQL в Docker

BACKUP_PATH="./backups"
DATE=$(date +%Y-%m-%d_%H%M%S)

echo "Starting backup at $DATE..."
mkdir -p $BACKUP_PATH

docker exec db_container pg_dumpall -U admin > $BACKUP_PATH/full_backup_$DATE.sql

echo "Backup completed successfully!"