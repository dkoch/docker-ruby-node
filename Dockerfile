FROM node:8-alpine
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
    ca-certificates
