FROM alpine:3.7
MAINTAINER Dieter Koch <dk@dkoch.org>

ENV RUBY_VERSION 2.4.5-r0
ENV NODEJS_VERSION 8.9.3-r1

# Install Ruby and additional packages required to install gems.
RUN apk update && \
  apk upgrade && \
  apk --update add \
    ca-certificates \
    libstdc++ \
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
