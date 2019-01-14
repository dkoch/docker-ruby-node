FROM alpine:3.4
MAINTAINER Dirk Siemers <dirk@sovido.de>

# Compile FFMPEG - This is up here so we don't have to recompile when something
# below changes.
ENV FFMPEG_VERSION=3.1.2
RUN apk add --update build-base curl nasm tar bzip2 zlib-dev openssl-dev \
  yasm-dev lame-dev libogg-dev x264-dev libvpx-dev \
  libvorbis-dev x265-dev freetype-dev libass-dev faac-dev \
  libwebp-dev rtmpdump-dev libtheora-dev opus-dev && \
  DIR=$(mktemp -d) && cd ${DIR} && \
  curl -s http://ffmpeg.org/releases/ffmpeg-${FFMPEG_VERSION}.tar.gz | tar zxvf - -C . && \
  cd ffmpeg-${FFMPEG_VERSION} && \
  ./configure \
  --enable-version3 --enable-gpl --enable-nonfree --enable-small \
  --enable-libmp3lame --enable-libx264 --enable-libx265 --enable-libvpx \
  --enable-libtheora --enable-libvorbis --enable-libopus --enable-libass \
  --enable-libwebp --enable-librtmp --enable-postproc --enable-avresample \
  --enable-libfreetype --enable-openssl --disable-debug --enable-libfaac && \
  make && \
  make install && \
  make distclean && \
  rm -rf ${DIR} && \
  apk del build-base curl tar bzip2 x264 openssl nasm && rm -rf /var/cache/apk/*

ENV BUILD_PACKAGES bash build-base curl-dev ruby-dev tzdata
ENV RUBY_PACKAGES ruby ruby-io-console ruby-bundler ruby-bigdecimal
ENV EXTRA_PACKAGES docker git libxml2-dev libxslt-dev libev-dev libffi-dev

# Update and install all of the required packages.
# At the end, remove the apk cache
RUN apk update && \
  apk upgrade && \
  apk add $BUILD_PACKAGES && \
  apk add $RUBY_PACKAGES && \
  apk add $EXTRA_PACKAGES && \
  rm -rf /var/cache/apk/*

RUN mkdir /usr/app
WORKDIR /usr/app
