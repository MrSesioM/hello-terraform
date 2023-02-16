FROM httpd:alpine
WORKDIR /opt/hello-2048
COPY ./public_html/ /usr/local/apache2/htdocs
EXPOSE 80
LABEL org.opencontainers.image.source https://github.com/MrSesioM/hello-2048
