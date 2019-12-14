FROM alpine:edge

# Installs latest Chromium (76) package.
# Tell Puppeteer to skip installing Chrome. We'll be using the installed package.

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

# Puppeteer v1.9.0 works with Chromium 68.
# - This installation of puppeteer will not be used if the web project this cloud builder is used
#   on installs puppeteer itself. I.e the web project's puppeteer dependency will take precedence.
RUN yarn add puppeteer@2.0.0

# It's a good idea to use dumb-init to help prevent zombie chrome processes.
ADD https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64 /usr/local/bin/dumb-init
RUN chmod +x /usr/local/bin/dumb-init

ENTRYPOINT ["dumb-init", "--", "yarn"]
