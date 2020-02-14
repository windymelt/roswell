FROM debian:stretch-slim

ARG libs='automake libcurl4-gnutls-dev make gcc curl bzip2 locales libev-dev libuv1-dev tidy git zlib1g-dev libssl-dev'
RUN apt-get update && apt-get install -y ${libs}

ARG roswell_archive_url='https://github.com/roswell/roswell/archive/release.tar.gz'
RUN echo 'install roswell' \
  && curl -SL ${roswell_archive_url} \
  | tar -xzC /tmp/ \
  && cd /tmp/roswell-release \
  && sh bootstrap \
  && ./configure \
  && make \
  && make install \
  && rm -rf /tmp/roswell-release

# locale setting
RUN locale-gen en_US.UTF-8
ARG LANG=en_US.UTF-8
ARG LANGUAGE=en_US:en
ARG LC_ALL=en_US.UTF-8

RUN ros setup
RUN ros install sbcl/1.5.9
RUN ros use sbcl/1.5.9

# Standard tools
RUN ros install fukamachi/qlot
RUN ros install clack
ARG PATH=/root/.roswell/bin:/usr/local/bin:$PATH

RUN mkdir /app

COPY boot-swank.lisp /app/boot-swank.lisp

COPY init.lisp /root/.roswell/init.lisp

WORKDIR /app

CMD "ros"
