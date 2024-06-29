#!/bin/bash

# Las tres variables de configuración del host ftp
HOST="ftp.direccion.net"
USER="username"
PASSWORD="password"

# $1 es el primer argumento del script
DESTINATION="htdocs"

# entrar dentro de public_html
cd ../public_html
# subir al servidor
ftp -inv $HOST <<EOF
user $USER $PASSWORD
passive
cd $DESTINATION
mput *
mput otra-carpeta/*
bye
EOF
# volver al directorio util desde public_html
cd ../util
