#!/bin/sh
docker compose down

rm -rf ./app
rm .env
sudo rm -rf ./strapi-data

docker rmi strapi