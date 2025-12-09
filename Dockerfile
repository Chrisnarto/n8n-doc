FROM node:18-bullseye

RUN apt-get update && apt-get install -y ffmpeg && apt-get clean

WORKDIR /app

RUN npm install -g n8n

RUN mkdir /data
ENV N8N_USER_FOLDER=/data

EXPOSE 5678

ENTRYPOINT ["n8n"]
CMD ["start"]
