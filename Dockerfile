FROM ubuntu:16.04

MAINTAINER Lindoélio Lázaro <lindoelio@gmail.com>

COPY anope-config.cache /tmp
COPY hybrid-ircd.conf /tmp

RUN ./bootstrap.sh