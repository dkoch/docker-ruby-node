FROM dieterkoch/ruby-node:2.6.5-alpine
MAINTAINER Dieter Koch <dk@dkoch.org>

# Install Ruby and additional packages required to install gems.
RUN apk update && \
  apk upgrade && \
  apk --update --no-cache add \
    libc6-compat \
    imagemagick \
    p7zip \
    poppler \
    poppler-utils \
  && rm -rf /var/cache/apk/*
