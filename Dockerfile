FROM node:7.4-alpine

COPY ./ /home/node

WORKDIR /home/node
RUN apk add --no-cache --virtual .build-deps \
    binutils-gold \
    curl \
    g++ \
    gcc \
    gnupg \
    libgcc \
    linux-headers \
    make \
    python && \
    npm install -g eslint && \
    apk del .build-deps

RUN chown -R node:node /home/node
USER node
CMD ["node"]
