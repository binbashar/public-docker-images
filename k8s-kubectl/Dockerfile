#
# Set the base image
#
FROM alpine:3.10.1 as builder

# Here K8S_VERSION is coming from the custom build args K8S_VERSION=$DOCKER_TAG hooks/file script.
# Ref: https://docs.docker.com/docker-hub/builds/advanced/
ARG K8S_VERSION

ENV K8S_VERSION $K8S_VERSION

#
# Installation
#
RUN apk --no-cache add bash
RUN set -x                  && \
    apk --update upgrade    && \
    apk add ca-certificates && \
    rm -rf /var/cache/apk/* && \
    wget -O /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/$K8S_VERSION/bin/linux/amd64/kubectl && \
    chmod +x /usr/local/bin/kubectl

#FROM scratch
#COPY --from=builder /kubectl /kubectl
ENTRYPOINT ["/usr/local/bin/kubectl"]