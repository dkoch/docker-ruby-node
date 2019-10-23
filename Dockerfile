FROM alpine:3.10
MAINTAINER Dieter Koch <dk@dkoch.org>

ENV RUBY_VERSION 2.5.7-r0
ENV NODEJS_VERSION 10.16.3-r0

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
