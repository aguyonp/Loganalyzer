FROM alpine:3.12
LABEL maintainer="Antoine GUYON"

# Setup apache and php
RUN apk --update \
    add apache2 \
    curl \
    php7-apache2 \
    php7-bcmath \
    php7-bz2 \
    php7-calendar \
    php7-common \
    php7-ctype \
    php7-curl \
    php7-dom \
    php7-gd \
    php7-iconv \
    php7-json \
    php7-mbstring \
    php7-mcrypt \
    php7-mysqli \
    php7-mysqlnd \
    php7-openssl \
    php7-pdo_mysql \
    php7-pdo_pgsql \
    php7-pdo_sqlite \
    php7-phar \
    php7-session \
    php7-xml \
    php7-xmlrpc \
    && rm -f /var/cache/apk/* \
    && mkdir -p /opt/utils \
    && mkdir /htdocs

EXPOSE 80

ADD start.sh /opt/utils/
ADD src/ /htdocs/
RUN chown -Rf apache:apache /htdocs

RUN chmod +x /opt/utils/start.sh
RUN /opt/utils/start.sh

HEALTHCHECK CMD wget -q --no-cache --spider localhost/index.php

ENTRYPOINT ["httpd","-D","FOREGROUND"]
