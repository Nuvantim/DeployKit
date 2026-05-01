FROM alpine:latest

# Install dependencies & PHP extensions (POSTGRES)
RUN apk update && apk upgrade && apk add --no-cache curl git unzip php85 php85-pdo php85-iconv php85-pdo_pgsql php85-pdo_mysql php85-mysqlnd php85-openssl php85-mbstring php85-tokenizer php85-fileinfo php85-ctype php85-curl php85-phar php85-session php85-dom php85-xml php85-xmlwriter

# Symbolic link php
RUN ln -s /usr/bin/php85 /usr/bin/php

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer
    
# Set working directory
RUN mkdir -p /app
WORKDIR /app

# Copy application source
COPY . .

# Copy entrypoint script
RUN mv deploy/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Install Frankenphp
RUN curl -L -o /usr/bin/franken https://github.com/php/frankenphp/releases/download/v1.12.2/frankenphp-linux-x86_64-mimalloc && \
    chmod +x /usr/bin/franken

CMD ["/entrypoint.sh"]
