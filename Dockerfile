FROM dieterkoch/ruby-node:2.6.5-slim
LABEL maintainer="Dieter Koch <dk@dkoch.org>"

RUN apt-get update \
    && apt-get install -y \
    imagemagick \
    poppler-utils
