# Usa la imagen oficial de n8n
FROM n8nio/n8n:latest

# Cambiamos a root para instalar dependencias
USER root

# Instalar FFmpeg en Alpine
RUN apk update && apk add --no-cache ffmpeg git build-base curl

# Crear carpeta para whisper.cpp
RUN mkdir -p /whisper

# Clonar Whisper.cpp
RUN git clone https://github.com/ggerganov/whisper.cpp /whisper

# Compilar Whisper.cpp
RUN cd /whisper && make

# Descargar un modelo pequeño (base) para transcribir
RUN cd /whisper && \
    curl -L -o ggml-base.bin https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-base.bin

# Regresar al usuario de n8n
USER node

# Directorio de trabajo
WORKDIR /data

# Dar permisos
RUN mkdir -p /data && chmod -R 777 /data /whisper

# Exponer puerto
EXPOSE 5678

# Comando por defecto
CMD ["n8n"]
