#!/bin/bash
# Очистка node_modules и npm/ян-кэша во всех проектах внизу по дереву

echo "🧹 Ищу node_modules..."

find . -name "node_modules" -type d -prune -exec rm -rf '{}' + 2>/dev/null
find . -name ".next" -type d -prune -exec rm -rf '{}' + 2>/dev/null
find . -name "dist" -type d -prune -exec rm -rf '{}' + 2>/dev/null

echo "🗑️  Очищаю npm кэш..."
npm cache clean --force 2>/dev/null

echo "✅ Готово! Место освобождено."
