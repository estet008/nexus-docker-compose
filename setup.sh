#!/bin/bash

set -e

# ---------------------------
# Nexus Prover setup script for Docker Compose
# ---------------------------

# 🔢 Запит NODE ID у користувача
read -p "🔢 Введіть ваш NODE ID: " NODE_ID

if [[ -z "$NODE_ID" ]]; then
  echo "❌ NODE ID не може бути порожнім"
  exit 1
fi

# Перевірка наявності файлу шаблону
if [[ ! -f docker-compose.yml ]]; then
  echo "❌ Помилка: Файл docker-compose.yml не знайдено. Перевірте, чи ви в кореневій директорії репозиторію."
  exit 1
fi

# Генерація фінального docker-compose файлу
cp docker-compose.yml docker-compose.generated.yml
sed -i "s|\${NODE_ID}|$NODE_ID|g" docker-compose.generated.yml

# Запуск контейнерів
echo "✅ Файл docker-compose.generated.yml створено з вашим NODE ID"
echo "🚀 Запускаємо Docker Compose..."
docker compose -f docker-compose.generated.yml up -d --build

# Готово
echo "✅ Nexus Prover успішно встановлено та запущено в Docker!"
echo "💡 Перевірте статус контейнерів командою: docker compose ps"
echo 
