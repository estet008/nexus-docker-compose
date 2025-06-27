#!/bin/bash

# Nexus bootstrap installer for Docker Compose

REPO_DIR="nexus-docker-compose"
REPO_URL="https://github.com/estet008/nexus-docker-compose.git"

# Видалити старий каталог, якщо існує
if [ -d "$REPO_DIR" ]; then
  echo "🧹 Знайдено існуючий каталог $REPO_DIR. Видаляю..."
  rm -rf "$REPO_DIR"
fi

# Клонувати репозиторій
echo "⬇️ Клоную репозиторій..."
git clone "$REPO_URL"
cd "$REPO_DIR"

# Запустити setup.sh
bash setup.sh
