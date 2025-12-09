# Imagen oficial de n8n (Debian)
FROM n8nio/n8n:latest

# Cambiar a root para instalar paquetes
USER root

# Instalar FFmpeg
RUN apt-get update && apt-get install -y ffmpeg && apt-get clean

# Regresar a usuario original
USER node

# Mantener configuraciones previas
WORKDIR /data
EXPOSE 5678

CMD ["n8n"]
