FROM binbash/terraform-resources:0.13.0

MAINTAINER Binbash Leverage (info@binbash.com.ar)

ENV AWSCLI_VERSION=1.18.96
ENV PYTHON_VERSION=3.8.3

#
# Pre-requisites: Python 3.8.x
#
RUN apt-get update \
  && apt-get install -y apt-utils build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev \
  libsqlite3-dev libreadline-dev libffi-dev curl libbz2-dev oathtool \
  && apt-get clean \
	&& curl -O https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tar.xz \
	&& tar -xf Python-${PYTHON_VERSION}.tar.xz \
	&& cd Python-${PYTHON_VERSION} \
  && ./configure --enable-optimizations \
	&& make -j 4 \
	&& make altinstall

#
# awscli Installation
#
RUN apt-get install -y jq python3-pip \
	&& apt-get clean \
	&& pip3 install --upgrade pip \
	&& pip3 install -Iv awscli==${AWSCLI_VERSION}

#
# Check python was correctly installed
RUN update-alternatives --install /usr/bin/python3 python3 /usr/local/bin/python3.8 1 && python3 --version

CMD ["--version"]
ENTRYPOINT ["aws"]
