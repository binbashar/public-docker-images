#
# Set the base image
#
FROM alpine:3.12.6

MAINTAINER Binbash Leverage (info@binbash.com.ar)

ARG DOCKER_TAG
ARG SCOUTSUITE_VERSION=${DOCKER_TAG}

VOLUME ["/report"]

RUN apk upgrade --no-cache && \
    apk add --no-cache bash && \
    apk add --no-cache python3 && \
    apk add --no-cache --virtual build_deps make g++ gcc musl-dev libffi-dev openssl-dev && \
    apk add --update --no-cache python3-dev curl py-pip && \
    pip3 install --upgrade pip && \
    pip3 install cryptography==2.8 && \
    pip3 install scoutsuite==${SCOUTSUITE_VERSION} && \
    apk del build_deps

WORKDIR /report

CMD ["-v"]
ENTRYPOINT ["scout"]
