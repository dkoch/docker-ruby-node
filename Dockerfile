FROM dieterkoch/ruby-node:2.6.5-slim
LABEL maintainer="Dieter Koch <dk@dkoch.org>"

RUN apt-get update \
    && apt-get install -y \
    build-essential \
    libxml2-dev \
    libxslt-dev \
    libz-dev \
    nodejs \
    ruby-dev \
    zlib1g-dev

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install -y \
    nodejs \
    yarn
