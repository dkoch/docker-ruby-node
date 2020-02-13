FROM alpine:3.11
MAINTAINER Dieter Koch <dk@dkoch.org>

ENV RUBY_VERSION 2.6.5-r2
ENV NODEJS_VERSION 12.15.0-r1

# Install Ruby and additional packages required to install gems.
RUN apk update && \
  apk upgrade && \
  apk --update add \
    ca-certificates \
    libstdc++ \
    less \
    libpq \
    libxslt \
    "nodejs=${NODEJS_VERSION}" \
    "ruby=${RUBY_VERSION}" \
    ruby-bigdecimal \
    ruby-bundler \
    ruby-io-console \
    ruby-irb \
    ruby-json \
    ruby-rake \
    tzdata \
  && rm -rf /var/cache/apk/*
