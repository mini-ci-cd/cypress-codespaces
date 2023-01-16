ARG VARIANT=16-bullseye
FROM mcr.microsoft.com/vscode/devcontainers/javascript-node:${VARIANT}

# https://docs.cypress.io/guides/continuous-integration/introduction#Dependencies
RUN apt-get -qq update && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get -y install -qq --no-install-recommends \
    libgtk2.0-0 \
    libgtk-3-0 \
    libgbm-dev \
    libnotify-dev \
    libgconf-2-4 \
    libnss3 \
    libxss1 \
    libasound2 \
    libxtst6 xauth xvfb


RUN yarn global add cypress @mocks-server/main js-yaml
USER node
RUN cypress install
