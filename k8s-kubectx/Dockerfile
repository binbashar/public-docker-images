ARG DOCKER_TAG
ARG K8S_VERSION=${DOCKER_TAG}
ARG VERSION="0.9.1"

#
# Set the base image
#
FROM binbash/k8s-kubectl:${K8S_VERSION}

MAINTAINER Binbash Leverage (info@binbash.com.ar)

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
