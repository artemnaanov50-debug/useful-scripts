#!/bin/bash
# Убить процесс, который занимает конкретный порт

if [ -z "$1" ]; then
  echo "Использование: $0 <порт>"
  echo "Пример: $0 3000"
  exit 1
fi

PORT=$1
PID=$(lsof -ti :$PORT)

if [ -z "$PID" ]; then
  echo "На порту $PORT ничего не работает"
  exit 0
fi

echo "Нашел процесс $PID на порту $PORT"
kill -9 $PID
echo "✅ Процесс убит"
