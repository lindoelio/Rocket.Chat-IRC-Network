FROM ubuntu:16.04

LABEL description="Provides an IRC Network for Rocket.Chat federation"
LABEL maintainer="lindoelio@gmail.com"
LABEL version="1.0"

COPY anope-config.cache /tmp
COPY anope-services.conf /tmp
COPY hybrid-ircd.conf /tmp

ADD bootstrap.sh /root/bootstrap.sh
CMD /root/bootstrap.sh

EXPOSE 6667 7000