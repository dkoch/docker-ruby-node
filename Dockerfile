FROM ruby:2.6.6-slim
LABEL maintainer="Dieter Koch <dk@dkoch.org>"

RUN gem install bundler

RUN apt-get update \
    && apt-get install -y \
    curl \
    libpq-dev \
    && apt-get clean
