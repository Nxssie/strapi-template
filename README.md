A production-ready Docker setup for Strapi CMS with PostgreSQL database. This repository provides an easy way to deploy Strapi using Docker Compose with automated initialization scripts.

## 🚀 Features

- **Strapi v5** with Node.js 22 Alpine
- **PostgreSQL 16** database
- Automated setup with secure random credentials
- Volume persistence for uploads and database
- Development-ready configuration
- Clean-up scripts included

## 📋 Prerequisites

- Docker Engine 20.10+
- Docker Compose v2.0+
- OpenSSL (for generating secure secrets)
- npx (Node Package Execute)

## 🛠️ Quick Start

1. **Clone the repository**
   ```bash
   git clone git@github.com:Nxssie/strapi-template.git
   cd strapi-template
   ```

2. **Run the initialization script**
   ```bash
   chmod +x init.sh
   ./init.sh
   ```

   This script will:
   - Create a new Strapi application
   - Generate secure random passwords and secrets
   - Configure PostgreSQL connection
   - Start the Docker containers

3. **Access Strapi**
   - Admin Panel: http://localhost:1337/admin
   - API: http://localhost:1337

## 📁 Project Structure

```
.
├── app/                    # Strapi application (generated)
├── strapi-data/           # PostgreSQL data volume
├── .env                   # Environment variables (generated)
├── .env.example           # Example environment variables
├── docker-compose.yml     # Docker Compose configuration
├── Dockerfile            # Strapi container image
├── init.sh               # Initialization script
└── stop.sh               # Clean-up script
```

## ⚙️ Configuration

### Environment Variables

The `.env` file is automatically generated with secure values. If you need to customize:

| Variable | Description | Default |
|----------|-------------|---------|
| `DATABASE_CLIENT` | Database type | `postgres` |
| `DATABASE_HOST` | Database hostname | `strapiDB` |
| `DATABASE_PORT` | Database port | `5432` |
| `DATABASE_NAME` | Database name | `strapi` |
| `DATABASE_USERNAME` | Database user | `strapi` |
| `DATABASE_PASSWORD` | Database password | Auto-generated |
| `JWT_SECRET` | JWT secret key | Auto-generated |
| `ADMIN_JWT_SECRET` | Admin JWT secret | Auto-generated |
| `API_TOKEN_SALT` | API token salt | Auto-generated |
| `APP_KEYS` | Application keys | Auto-generated |
| `NODE_ENV` | Node environment | `development` |

### Ports

- **Strapi**: 1337
- **PostgreSQL**: 5432

## 🔧 Usage

### Starting the services
```bash
docker compose up -d
```

### Stopping the services
```bash
docker compose down
```

### Viewing logs
```bash
docker compose logs -f strapi
```

### Complete cleanup
```bash
chmod +x stop.sh
./stop.sh
```

⚠️ **Warning**: The `stop.sh` script will remove:
- All containers
- The Strapi application directory
- PostgreSQL data
- Docker images
- Environment files

## 📦 Volumes

- `./app/config` - Strapi configuration
- `./app/src` - Source code
- `./app/public/uploads` - Media uploads
- `./strapi-data` - PostgreSQL data

## 🐳 Docker Details

### Strapi Container
- Based on `node:22-alpine`
- Includes sharp dependencies for image processing
- Runs as non-root user
- Exposes port 1337

### PostgreSQL Container
- Uses `postgres:16.0-alpine`
- Platform specification for Apple M1 compatibility
- Data persisted in named volume

## 🔒 Security Considerations

- All secrets are randomly generated during initialization
- Database runs in an isolated network
- Strapi runs as non-root user
- Consider using HTTPS in production
- Change default ports in production environments

## 🚀 Production Deployment

For production use:

1. Change `NODE_ENV` to `production`
2. Use strong passwords (already auto-generated)
3. Configure a reverse proxy (nginx, traefik)
4. Enable SSL/TLS
5. Set up regular backups
6. Monitor resource usage

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🙏 Acknowledgments

- [Strapi](https://strapi.io/) - The leading open-source headless CMS
- [PostgreSQL](https://www.postgresql.org/) - The world's most advanced open source database
- [Docker](https://www.docker.com/) - Containerization platform
