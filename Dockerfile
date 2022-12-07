FROM debian:bullseye-slim
RUN apt-get update && apt-get upgrade \
    && apt-get -y install nginx libnginx-mod-rtmp ffmpeg gettext-base \
    && rm -rf /var/cache/apk/*
COPY nginx.conf /
EXPOSE 80
CMD ["/bin/bash", "-c", "envsubst '$WHITELIST_IPS $REAL_IP_FROM' < /nginx.conf > /etc/nginx/nginx.conf && exec nginx -g 'daemon off;'"]