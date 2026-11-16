#!/bin/bash
# Быстрый бэкап папок с датой в имени

if [ $# -eq 0 ]; then
  echo "Использование: $0 <папка1> [папка2] ..."
  echo "Пример: $0 ~/Documents ~/Projects"
  exit 1
fi

DATE=$(date +%Y-%m-%d_%H-%M)
BACKUP_DIR="$HOME/Backups/$DATE"
mkdir -p "$BACKUP_DIR"

echo "📦 Создаю бэкап в: $BACKUP_DIR"

for dir in "$@"; do
  if [ -d "$dir" ]; then
    name=$(basename "$dir")
    echo "  → копирую $dir"
    cp -r "$dir" "$BACKUP_DIR/$name"
  else
    echo "  ⚠️  Папка не найдена: $dir"
  fi
done

echo "✅ Готово! Бэкап сохранён в $BACKUP_DIR"
