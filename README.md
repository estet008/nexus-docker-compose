# Nexus Prover Installer — README

## 📋 Мінімальні вимоги до сервера

- ✅ **Операційна система:** Ubuntu 24.04 LTS
- ✅ **Процесор:** 2 ядра (x86_64)
- ✅ **Оперативна памʼять:** мінімум 2 GB
- ✅ **Дисковий простір:** мінімум 10 GB вільного простору
- ✅ **Інтернет:** стабільне підключення

## 🚀 Рекомендовані вимоги для оптимальної роботи

- 🏆 **Операційна система:** Ubuntu 24.04 LTS (свіжа інсталяція)
- 🏆 **Процесор:** 4 ядра (або більше)
- 🏆 **Оперативна памʼять:** 8 GB або більше
- 🏆 **Дисковий простір:** SSD з 50 GB+ вільного місця
- 🏆 **Інтернет:** постійне зʼєднання без обривів, швидкість від 10 Mbps

## 🐳 Залежності

Перед запуском переконайтесь, що система оновлена:

```bash
sudo apt update && sudo apt upgrade -y
```

### 📦 Встановлення Docker та Docker Compose

```bash
sudo apt install docker.io docker-compose -y
sudo systemctl enable --now docker
```

## ⚙️ Встановлення Nexus Prover (через Docker Compose)

### ✅ Автоматичне встановлення в одну команду:

```bash
bash <(curl -sSf https://raw.githubusercontent.com/estet008/nexus-docker-compose/main/setup.sh)
```

> Ця команда:
> - запитує NODE ID
> - генерує docker-compose файл з урахуванням введеного NODE ID
> - виводить команду для запуску контейнерів

### 📁 Структура репозиторію

У вашому локальному репозиторії будуть наступні файли:

- `setup.sh` — скрипт, що запитує NODE ID та генерує `docker-compose.generated.yml`
- `Dockerfile` — описує, як створити Docker-образ Nexus CLI
- `entrypoint.sh` — точка входу, яка запускає Nexus CLI у контейнері
- `docker-compose.yml` — шаблон для створення фінального `docker-compose.generated.yml`

```bash
nexus-docker-compose/
├── setup.sh
├── Dockerfile
├── entrypoint.sh
├── docker-compose.yml
```

## 🛠️ Керування Nexus Prover через Docker Compose

- 🔍 Перевірити статус:
  ```bash
  docker compose ps
  ```
- 🔴 Зупинити вручну:
  ```bash
  docker compose down
  ```
- ♻️ Перезапустити:
  ```bash
  docker compose restart
  ```

## 🔄 Оновлення Nexus CLI (у Docker Compose)

> Використовується **Watchtower**, що автоматично перевіряє оновлення образу та перезапускає контейнер

## 🔍 Перевірка версії Nexus CLI (у Docker)

```bash
docker exec -it nexus-instance /home/prover/.nexus/bin/nexus-network --version
```

> Якщо команда повертає помилку «No such file or directory», CLI не встановлено або ще не завантажено через мережеві обмеження.

## ℹ️ Примітка

Під час Testnet III очікується, що Nexus CLI може не запускатися автоматично або видавати повідомлення про "No such device or address" — це не помилка, а очікувана поведінка під час тестування мережі.

---
