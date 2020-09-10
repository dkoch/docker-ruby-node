FROM ruby:2.6.6-slim
LABEL maintainer="Dieter Koch <dk@dkoch.org>"

RUN gem install bundler

RUN apt-get update \
    && apt-get install --no-install-recommends -yqq \
      curl \
      gnupg \
      libpq-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
