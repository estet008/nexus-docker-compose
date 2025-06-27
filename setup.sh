#!/bin/bash

echo -n "🔢 Введіть ваш NODE ID: "
read NODE_ID

if [[ -z "$NODE_ID" ]]; then
  echo "❌ NODE ID не може бути порожнім"
  exit 1
fi

sed "s/REPLACE_ME/$NODE_ID/" docker-compose.yml > docker-compose.generated.yml

echo "✅ Файл docker-compose.generated.yml створено з вашим NODE ID"
echo "👉 Запустіть його командою:"
echo "   docker compose -f docker-compose.generated.yml up -d --build"
