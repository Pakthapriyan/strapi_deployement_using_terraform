#!/bin/bash
set -e

# 1. Update & install dependencies
apt-get update -y
apt-get install -y \
  curl \
  docker.io \
  docker-compose \
  git \
  unzip

# 2. Start Docker service
systemctl enable docker
systemctl start docker

# 3. Add ubuntu user to docker group (if running as ubuntu)
usermod -aG docker ubuntu

# 4. Create Docker Compose file for Strapi
cat > /home/ubuntu/docker-compose.yml << 'EOF'
version: '3.8'

services:
  strapi:
    image: strapi/strapi:latest
    container_name: strapi
    restart: unless-stopped
    volumes:
      - strapi_data:/srv/app
    environment:
      - NODE_ENV=production
    ports:
      - "1337:1337"

volumes:
  strapi_data:
EOF

# 5. Change ownership and launch Strapi
chown -R ubuntu:ubuntu /home/ubuntu
cd /home/ubuntu
docker-compose up -d

echo "✅ Strapi is launching on port 1337"

# chmod +x install-strapi.sh
# Make it executable