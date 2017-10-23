
ARG PARENT_CONTAINER=agabert/vectorpip:latest

FROM $PARENT_CONTAINER

LABEL maintainer="Alexander Gabert <alex@xoreaxeax.de>"
LABEL repository="https://github.com/agabert/vector"

ADD docker/vector/opt/vector /opt/vector

WORKDIR /opt/vector

ENTRYPOINT ["/opt/vector/usr/sbin/entrypoint.sh"]

