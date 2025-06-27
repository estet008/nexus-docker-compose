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
sudo apt install docker.io -y
sudo systemctl enable --now docker
```

⚠️ Якщо система не має `docker compose`, встановіть плагін:

```bash
sudo apt install docker-compose-plugin -y
```

## ⚙️ Встановлення Nexus Prover (через Docker Compose)

### ✅ Автоматичне встановлення в одну команду:

```bash
bash <(curl -sSf https://raw.githubusercontent.com/estet008/nexus-docker-compose/main/bootstrap.sh)
```

> Ця команда:
> - встановлює всі залежності (Docker, плагін Compose)
> - клонує репозиторій
> - запитує NODE ID
> - генерує `docker-compose.generated.yml` з урахуванням введеного NODE ID
> - запускає контейнер через Docker Compose


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

> **Watchtower** автоматично перевіряє оновлення образу та перезапускає контейнер

Або оновити вручну:

```bash
docker compose down
docker image rm nexusprover
docker compose -f docker-compose.generated.yml up -d --build
```

## 🔍 Перевірка версії Nexus CLI (у Docker)

```bash
docker exec -it nexus-instance /home/prover/.nexus/bin/nexus-network --version
```

> Якщо команда повертає помилку «No such file or directory», CLI не встановлено або ще не завантажено через мережеві обмеження.

## ℹ️ Примітка

Під час Testnet III очікується, що Nexus CLI може не запускатися автоматично або видавати повідомлення про "No such device or address" — це не помилка, а очікувана поведінка під час тестування мережі.

---
