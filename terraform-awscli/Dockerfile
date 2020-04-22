FROM binbash/terraform-resources:0.12.24

MAINTAINER Binbash Leverage (info@binbash.com.ar)

ENV AWSCLI_VERSION=1.18.41

#
# Installation
#
RUN apt-get update \
	&& apt-get install -y jq python-pip \
	&& apt-get clean \
	&& pip install --upgrade pip \
	&& pip install -Iv awscli==${AWSCLI_VERSION}

CMD ["--version"]
ENTRYPOINT ["aws"]