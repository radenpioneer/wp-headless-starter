FROM wordpress:6.2.2-fpm-alpine
ARG WPGRAPHQL_VERSION

WORKDIR /usr/src/wordpress

RUN rm -rf ./wp-content/themes/*
RUN rm -rf ./wp-content/plugins/*

RUN apk add zip --no-cache
RUN curl -o wpgraphql.zip -fL https://github.com/wp-graphql/wp-graphql/releases/download/v${WPGRAPHQL_VERSION}/wp-graphql.zip && \
    unzip -q wpgraphql.zip -d wp-content/plugins/ && \
    rm wpgraphql.zip

RUN set -eux; \
  cp -s wp-config-docker.php wp-config.php

COPY theme ./wp-content/themes/headless/
