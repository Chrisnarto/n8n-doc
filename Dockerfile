# Usa la imagen oficial de n8n
FROM n8nio/n8n:latest

# Cambiamos al usuario root temporalmente porque n8n usa usuario sin permisos
USER root

# Instalar FFmpeg en Alpine
RUN apk update && apk add --no-cache ffmpeg

# Regresar al usuario original de n8n
USER node

# Establece directorio de trabajo
WORKDIR /data

# Expone el puerto
EXPOSE 5678

# Comando por defecto
CMD ["n8n"]
