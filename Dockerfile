# Imagen base con Debian donde SÍ funciona apt-get
FROM node:18-bullseye

# Instalar FFmpeg
RUN apt-get update && apt-get install -y ffmpeg && apt-get clean

# Crear carpeta para n8n
WORKDIR /app

# Instalar n8n globalmente
RUN npm install -g n8n

# Crear y usar directorio de datos
RUN mkdir /data
ENV N8N_USER_FOLDER=/data

# Exponer el puerto que usa n8n
EXPOSE 5678

# Comando de inicio
CMD ["n8n", "start"]
