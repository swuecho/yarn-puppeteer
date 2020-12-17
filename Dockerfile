FROM alpine:3.10.2


RUN apk add --no-cache \
  chromium \
  nss \
  freetype \
  freetype-dev \
  harfbuzz \
  ca-certificates \
  ttf-freefont \
  nodejs \
  yarn 

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true
ENV JEST_PUPPETEER_CONFIG jest-puppeteer.config.ci.js
ENV CI true

ADD https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64 /usr/local/bin/dumb-init
RUN chmod +x /usr/local/bin/dumb-init

ENTRYPOINT ["dumb-init", "--", "yarn"]
