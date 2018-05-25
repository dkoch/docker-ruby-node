FROM mhart/alpine-node:8
MAINTAINER Dieter Koch <dk@dkoch.org>

# Install Ruby and additional packages required to install gems.
RUN apk update && \
  apk upgrade && \
  apk --update add \
    ruby=2.4.4-r0 \
    ruby-bigdecimal \
    ruby-bundler \
    ruby-io-console \
    ruby-irb \
    ruby-json \
    ruby-rake \
    libstdc++ \
    libpq \
    libxslt \
    tzdata \
    ca-certificates \
    build-base \
    git \
    libc-dev \
    libffi-dev \
    libxml2-dev \
    libxslt-dev \
    linux-headers \
    libressl-dev \
    postgresql-dev \
    ruby-dev

# Configure gem and bundler
RUN echo 'gem: --no-document' > /etc/gemrc && \
  bundle config build.nokogiri --use-system-libraries
