#!/bin/bash
# setup_letsencrypt_certificate.sh - Instalación de Certbot y HTTPS
set -x # Muestra los comandos ejecutados
# Cargar variables de entorno del archivo .env
if [ -f .env ]; then
source .env
fi
# 1. Instalación de Certbot vía Snap
sudo snap install core && sudo snap refresh core
sudo apt remove certbot -y 2>/dev/null
sudo snap install --classic certbot
sudo ln -fs /snap/bin/certbot /usr/bin/certbot
# 2. Solicitud automática del certificado SSL/TLS
sudo certbot --apache \
-m "$LETSENCRYPT_EMAIL" \
--agree-tos \
--no-eff-email \
-d "$LETSENCRYPT_DOMAIN" \
--non-interactive
