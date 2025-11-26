FROM alpine:latest

# Instalamos vsftpd, shadow (para gestión de usuarios) y herramientas básicas
RUN apk add --no-cache vsftpd shadow

# Copiamos configuración y script de entrada
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY entrypoint.sh /entrypoint.sh

# Damos permisos de ejecución al script
RUN chmod +x /entrypoint.sh

# Puertos: 21 (Comandos), 20 (Datos activo), 21100-21110 (Datos pasivo)
EXPOSE 20 21 21100-21110

# En lugar de CMD directo a vsftpd, usamos nuestro script
ENTRYPOINT ["/entrypoint.sh"]
