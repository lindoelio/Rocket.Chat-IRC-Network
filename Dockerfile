FROM ubuntu:16.04

MAINTAINER Lindoélio Lázaro <lindoelio@gmail.com>

COPY anope-config.cache /tmp
COPY anope-services.conf /tmp
COPY hybrid-ircd.conf /tmp

RUN ./bootstrap.sh

EXPOSE 6667 7000
ENTRYPOINT ["server", "-b", "0.0.0.0"]