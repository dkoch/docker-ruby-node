FROM dieterkoch/ruby-node:2.5.7-alpine
MAINTAINER Dieter Koch <dk@dkoch.org>

# Install Ruby and additional packages required to install gems.
RUN apk update && \
  apk upgrade && \
  apk --update add \
    libc6-compat \
    imagemagick \
    p7zip \
    poppler \
    poppler-utils \
  && rm -rf /var/cache/apk/*
