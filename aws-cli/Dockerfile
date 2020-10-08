#
# Set the base image
#
FROM python:3.8

MAINTAINER Binbash Leverage (info@binbash.com.ar)

ARG DOCKER_TAG
ARG AWSCLI_VERSION=${DOCKER_TAG}
ARG PYPIP_VERSION=20.2.3

#
# Installation
#
RUN apt-get update \
	&& apt-get install -y jq \
	&& apt-get clean \
  && pip install -Iv pip==${PYPIP_VERSION} \
  && pip install -Iv awscli==${AWSCLI_VERSION}

CMD ["--version"]
ENTRYPOINT ["aws"]
