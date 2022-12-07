FROM debian:bullseye-slim
RUN apt-get update && apt-get upgrade \
    && apt-get -y install nginx libnginx-mod-rtmp ffmpeg \
    && rm -rf /var/cache/apk/*
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]