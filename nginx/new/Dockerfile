FROM nginx:latest as build
RUN apt update && apt install -y iputils-ping
COPY templates/ /etc/nginx/templates/
COPY magento/* magento/
WORKDIR /etc/nginx/
