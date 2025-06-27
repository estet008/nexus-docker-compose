#!/bin/bash

set -e

# -----------------------------
# Nexus Prover Setup Script
# Працює з Docker Compose + Watchtower
# -----------------------------

# Запит Node ID у користувача
if [[ -z "$NODE_ID" ]]; then
  echo -n "🔢 Введіть ваш NODE ID: "
  read NODE_ID
fi
NODE_ID_CLEAN=$(echo "$NODE_ID" | tr -d '[:space:]' | sed 's/[^a-zA-Z0-9_-]//g')

if [[ -z "$NODE_ID_CLEAN" ]]; then
  echo "❌ Помилка: Node ID не може бути порожнім або містити недійсні символи"
  exit 1
fi

# Створення docker-compose.yml
cat <<EOF > docker-compose.yml
version: '3.8'

services:
  nexus-prover:
    image: nexusprover:latest
    container_name: nexus-instance
    restart: unless-stopped
    build:
      context: .
      dockerfile: Dockerfile
    environment:
      - NODE_ID=$NODE_ID_CLEAN
    volumes:
      - prover-data:/home/prover/.nexus

  watchtower:
    image: containrrr/watchtower
    container_name: watchtower
    restart: unless-stopped
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
    command: --cleanup --interval 300

volumes:
  prover-data:
EOF

echo "✅ Файл docker-compose.yml створено з NODE ID: $NODE_ID_CLEAN"
echo "🚀 Запустіть: docker compose up -d --build"
