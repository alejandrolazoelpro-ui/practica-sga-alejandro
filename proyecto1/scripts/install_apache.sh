#!/bin/bash
# install_apache.sh - Script de instalación de Apache Web Server
set -x # Muestra los comandos ejecutados
# Actualizar paquetes del sistema
sudo apt update -y
sudo apt upgrade -y
# Instalación de Apache HTTP Server
sudo apt install apache2 -y
# Habilitar e iniciar el servicio
sudo systemctl enable apache2
sudo systemctl start apache2
