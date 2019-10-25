#
# Set the base image
#
FROM alpine:3.10

MAINTAINER Binbash Leverage (info@binbash.com.ar)

# Here SCOUTSUITE_VERSION is coming from the custom build args SCOUTSUITE_VERSION=$DOCKER_TAG hooks/file script.
# Ref: https://docs.docker.com/docker-hub/builds/advanced/
ARG SCOUTSUITE_VERSION
ENV SCOUTSUITE_VERSION $SCOUTSUITE_VERSION

VOLUME ["/report"]

RUN apk upgrade --no-cache && \
    apk add --no-cache bash && \
    apk add --no-cache python3 && \
    apk add --no-cache --virtual build_deps make g++ gcc musl-dev libffi-dev openssl-dev python3-dev && \
    pip3 install --upgrade pip && \
    pip3 install scoutsuite==${SCOUTSUITE_VERSION} && \
    apk del build_deps

WORKDIR /report

CMD ["-v"]
ENTRYPOINT ["scout"]