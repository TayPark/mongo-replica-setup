#!/bin/bash

echo "[docker-compose] Stopping existing containers"
docker-compose stop

echo "[docker-compose] Starting containers..."
docker-compose up --remove-orphans -d

# echo "[docker-compose] Starting replica setup..."
# docker-compose exec mongodb1 mongo /scripts/setPrimary.js

# echo "[docker-compose] Please wait for PRIMARY node setup..."
# sleep 5

# echo "[docker-compose] Set SECONDARY nodes..."
# docker-compose exec mongodb2 mongo /scripts/setSecondary.js
# docker-compose exec mongodb3 mongo /scripts/setSecondary.js

# echo "[docker-compose] Replication is done!"
