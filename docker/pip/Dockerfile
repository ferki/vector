
ARG PARENT_CONTAINER=agabert/vectorbase:latest

FROM $PARENT_CONTAINER

LABEL maintainer="Alexander Gabert <alex@xoreaxeax.de>"
LABEL repository="https://github.com/agabert/vector"

ENV PACKAGES py-pip

ENV BUILD_DEPENDENCIES gcc binutils python-dev musl-dev libffi-dev openssl-dev linux-headers

ENV PIP_PACKAGES python-openstackclient

RUN apk update && \
    apk upgrade && \
    apk --no-cache add ${PACKAGES} && \
    rm -rfv /var/cache/apk/*

RUN apk add --no-cache --virtual .build-dependencies ${BUILD_DEPENDENCIES} && \
    pip install --no-cache-dir ${PIP_PACKAGES} && \
    apk del .build-dependencies && \
    rm -rfv /var/cache/apk/*

