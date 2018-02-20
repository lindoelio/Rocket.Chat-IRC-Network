FROM ubuntu:16.04

LABEL description="Provides an IRC Network for Rocket.Chat federation"
LABEL maintainer="Lindoélio Lázaro <lindoelio@gmail.com>"
LABEL version="1.0"

#COPY anope-config.cache /tmp
#COPY anope-services.conf /tmp
COPY hybrid-ircd.conf /tmp

ADD bootstrap.sh /root/bootstrap.sh
#CMD /root/bootstrap.sh

EXPOSE 6667 6697 7000 7001

# Run a really basic health check which makes sure the port is open.
HEALTHCHECK CMD  /usr/bin/nc 127.0.0.1 6667 < /dev/null || exit 1

ENTRYPOINT ["/root/bootstrap.sh"]