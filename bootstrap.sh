#!/bin/bash

# Nexus bootstrap installer for Docker Compose

REPO_DIR="nexus-docker-compose"
REPO_URL="https://github.com/estet008/nexus-docker-compose.git"

# Перевіримо, чи встановлений Docker
if ! command -v docker &> /dev/null; then
  echo "❌ Docker не встановлений. Встановлюємо..."
  sudo apt update
  sudo apt install docker.io -y
  sudo systemctl enable --now docker
fi

# Перевіримо, чи запущений Docker демон
if ! systemctl is-active --quiet docker; then
  echo "🛠️ Docker демон не запущений. Спроба запустити..."
  sudo systemctl enable --now docker
  sleep 2
fi

# Перевіримо наявність docker compose
if ! docker compose version &> /dev/null; then
  echo "🔧 Встановлюємо docker-compose-plugin..."
  sudo apt install docker-compose-plugin -y
fi

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

# Пояснення для користувача
cat <<EOF

✅ Готово! Ви можете керувати Nexus Prover з директорії $REPO_DIR.

📌 Команди:
  cd $REPO_DIR                       # перейти в директорію
  docker compose ps                 # статус контейнерів
  docker compose restart            # перезапуск
  docker compose down               # зупинка і видалення

🔁 Якщо хочете виконувати з будь-якої директорії:
  docker compose -f ~/$REPO_DIR/docker-compose.generated.yml ps

EOF
