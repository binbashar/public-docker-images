ARG TERRAFORM_VERSION=0.13.2
FROM hashicorp/terraform:${TERRAFORM_VERSION}

LABEL vendor="Binbash Leverage (info@binbash.com.ar)"

ARG AWSCLI_VERSION=1.18.126

# Install python3 and other useful dependencies
RUN apk update
RUN set -ex && \
        apk add ca-certificates && update-ca-certificates && \
	apk add --no-cache --update \
        curl \
        unzip \
        bash \
        make \
        tree \
        tzdata \
        jq \
        oath-toolkit-oathtool \
        python3
RUN rm /var/cache/apk/*

# Install latest pip3 and AWS CLI
RUN python3 -m ensurepip && \
        python3 -m pip install --upgrade pip && \
        rm -r /usr/lib/python*/ensurepip && \
        pip3 install awscli==${AWSCLI_VERSION}

ENTRYPOINT ["terraform"]