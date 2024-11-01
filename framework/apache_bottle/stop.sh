#!/bin/bash

#sudo docker ${ps}
docker compose down -v
# システムパージで全て削除
docker system prune -a --force
docker volume prune -a --force
docker system df
