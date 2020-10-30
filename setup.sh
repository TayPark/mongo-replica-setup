#!/bin/bash

# echo "[Replication setup] build file..."
# docker build -t repl-helper .

if [ $(docker ps -aq | wc -l) -gt 1 ]; then
  echo "[docker-compose] Restarting containers"
  docker-compose restart
else
  echo "[docker-compose] Starting containers..."
  docker-compose up --remove-orphans -d
fi

sleep 10

echo "[docker-compose] Done. check out"