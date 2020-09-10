FROM dieterkoch/ruby-node:2.6.6-slim
LABEL maintainer="Dieter Koch <dk@dkoch.org>"

# Set up Node and Yarn repos
RUN curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://deb.nodesource.com/node_12.x buster main" > /etc/apt/sources.list.d/nodesource.list \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update \
    && apt-get install --no-install-recommends -yqq \
      build-essential \
      libqt4-dev \
      libqtwebkit4 \
      libxml2-dev \
      libxslt-dev \
      libz-dev \
      git \
      nodejs \
      ruby-dev \
      xvfb \
      yarn \
      zlib1g-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
