FROM dieterkoch/ruby-node:2.6.6-slim
LABEL maintainer="Dieter Koch <dk@dkoch.org>"

# Set up Node and Yarn repos
RUN curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://deb.nodesource.com/node_12.x buster main" > /etc/apt/sources.list.d/nodesource.list \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# We save ~1 mb of final image size if we pull this up into the previous block. The win in readability offsets this.
RUN apt-get update \
    && apt-get install --no-install-recommends -yqq \
      gnupg \
      imagemagick \
      nodejs \
      poppler-utils \
      yarn \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
