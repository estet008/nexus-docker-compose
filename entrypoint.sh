#!/bin/bash

NODE_ID_CLEAN=$(echo "$NODE_ID" | tr -d '[:space:]' | sed 's/[^a-zA-Z0-9_-]//g')

if [[ -z "$NODE_ID_CLEAN" ]]; then
  echo "❌ NODE_ID не передано у середовищі контейнера"
  exit 1
fi

for i in {1..10}; do
  if [[ -x /home/prover/.nexus/bin/nexus-network ]]; then
    echo "✅ Знайдено nexus-network. Запуск..."
    /home/prover/.nexus/bin/nexus-network start --node-id "$NODE_ID_CLEAN"
    exit $?
  fi
  echo "🔄 Очікування появи nexus-network... Спроба $i"
  sleep 5
done

echo "⚠️ nexus-network так і не з'явився. Можливо, мережа недоступна або CLI ще не встановлено."
exit 1
