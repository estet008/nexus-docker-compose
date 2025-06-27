# Nexus Prover Installer — README

## 📋 Мінімальні вимоги до сервера

- ✅ **Операційна система:** Ubuntu 24.04 LTS
- ✅ **Процесор:** 2 ядра (x86\_64)
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

Перед запуском скрипта переконайтесь, що ваш сервер оновлений та має встановлені всі необхідні компоненти:

### 🔧 Підготовка системи

```bash
sudo apt update && sudo apt upgrade -y
```

### 🐋 Встановлення Docker та Docker Compose

```bash
sudo apt install -y docker.io docker-compose
sudo systemctl enable --now docker
```

- 📦 **systemd** (встановлено за замовчуванням в Ubuntu 24.04)

## ⚙️ Встановлення Nexus Prover (через Docker Compose)

1. Склонуйте репозиторій:
   ```bash
   git clone https://github.com/estet008/nexus-prover-installer.git
   cd nexus-prover-installer
   ```

2. Запустіть початковий скрипт, який запитає ваш `NODE ID` і створить `docker-compose.yml`:
   ```bash
   bash setup.sh
   ```

3. Запустіть все за допомогою:
   ```bash
   docker compose up -d --build
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
