# Usa la imagen oficial de n8n
FROM n8nio/n8n:latest

# Establece directorio de trabajo
WORKDIR /data

# Instala FFmpeg con APT (la imagen usa Debian)
USER root
RUN apt-get update && apt-get install -y ffmpeg && apt-get clean

# Regresa al usuario original de n8n
USER node

# Expone el puerto
EXPOSE 5678

# Comando por defecto
CMD ["n8n"]
