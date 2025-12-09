RUN apk add --no-cache ffmpeg
# Usa la imagen oficial de n8n
FROM n8nio/n8n:latest

# Establece directorio de trabajo
WORKDIR /data

# Expone el puerto
EXPOSE 5678

# Comando por defecto
CMD ["n8n"]
