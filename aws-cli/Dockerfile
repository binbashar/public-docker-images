#
# Set the base image
#
FROM python:3.8

MAINTAINER Binbash Leverage (info@binbash.com.ar)

# Here AWSCLI_VERSION is coming from the custom build args AWSCLI_VERSION=$DOCKER_TAG hooks/file script.
# Ref: https://docs.docker.com/docker-hub/builds/advanced/
ARG AWSCLI_VERSION
ENV AWSCLI_VERSION $AWSCLI_VERSION

#
# Installation
#
RUN apt-get update \
	&& apt-get install -y jq \
	&& apt-get clean \
	&& pip install --upgrade pip \
	&& pip install awscli

CMD ["--version"]
ENTRYPOINT ["aws"]