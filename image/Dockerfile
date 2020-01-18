FROM openjdk:11-jre
LABEL MAINTAINER mahiso <maik@mahiso.de>

ARG HISTORIAN_RELEASE=0.0.0

COPY ./install.sh /tmp/
COPY ./start.sh /tmp/

WORKDIR /tmp

RUN bash -el /tmp/install.sh https://github.com/mdzio/ccu-historian/releases/download/${HISTORIAN_RELEASE}/ccu-historian-${HISTORIAN_RELEASE}-bin.zip

ENV CONFIG_TYPE=CCU3

EXPOSE 80 2098 2099

VOLUME ["/database","/opt/ccu-historian/config"]

ENTRYPOINT ["/opt/ccu-historian/start.sh"]
