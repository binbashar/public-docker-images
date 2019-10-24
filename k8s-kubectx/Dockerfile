#
# Set the base image
#
FROM binbash/k8s-kubectl:latest

MAINTAINER Binbash Leverage (info@binbash.com.ar)

#
# ENV Vars
#
# Here K8S_VERSION is coming from the custom build args K8S_VERSION=$DOCKER_TAG hooks/file script.
# Ref: https://docs.docker.com/docker-hub/builds/advanced/
ARG K8S_VERSION

ENV K8S_VERSION $K8S_VERSION
ENV VERSION "0.6.3"

#
# Installation
#
RUN apk --no-cache add bash curl
RUN curl -L -o /usr/local/bin/kubectx https://raw.githubusercontent.com/ahmetb/kubectx/v${VERSION}/kubectx &&\
	curl -L -o /usr/local/bin/kubens https://raw.githubusercontent.com/ahmetb/kubectx/v${VERSION}/kubens &&\
    chmod +x /usr/local/bin/kubectx &&\
    chmod +x /usr/local/bin/kubens

#
# Entrypoint
#
COPY docker-entrypoint.sh /usr/local/bin/
RUN  chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT [ "docker-entrypoint.sh" ]

#
# Cmd execution
#
CMD [ "kubectx", "--help"]