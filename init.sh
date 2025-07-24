#!/bin/sh

generate_secret() {
    openssl rand -hex ${1:-64}
}

npx create-strapi-app ./app --quickstart --no-run --skip-cloud
npm install pg --save --prefix ./app

DB_PASSWORD=$(generate_secret 16)
JWT_SECRET=$(generate_secret 64)
ADMIN_JWT_SECRET=$(generate_secret 64)
API_TOKEN_SALT=$(generate_secret 32)
APP_KEY1=$(generate_secret 32)
APP_KEY2=$(generate_secret 32)
APP_KEY3=$(generate_secret 32)
APP_KEY4=$(generate_secret 32)
APP_KEYS="$APP_KEY1,$APP_KEY2,$APP_KEY3,$APP_KEY4"

cat > .env << EOF
DATABASE_CLIENT=postgres
DATABASE_HOST=strapiDB
DATABASE_PORT=5432
DATABASE_NAME=strapi
DATABASE_USERNAME=strapi
DATABASE_PASSWORD=$DB_PASSWORD

JWT_SECRET=$JWT_SECRET
ADMIN_JWT_SECRET=$ADMIN_JWT_SECRET
API_TOKEN_SALT=$API_TOKEN_SALT

APP_KEYS=$APP_KEYS

NODE_ENV=development
EOF

cp .env ./app/.env

docker compose up -d