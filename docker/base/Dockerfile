
ARG PARENT_CONTAINER=alpine:latest

FROM $PARENT_CONTAINER

LABEL maintainer="Alexander Gabert <alex@xoreaxeax.de>"
LABEL repository="https://github.com/agabert/vector"

ENV PACKAGES ca-certificates bash openssl openssh unzip bzip2 make wget curl jq

RUN apk update && \
    apk upgrade && \
    apk --no-cache add ${PACKAGES} && \
    rm -rfv /var/cache/apk/*

