ARG TERRAFORM_VERSION=0.13.0
FROM hashicorp/terraform:${TERRAFORM_VERSION}

LABEL vendor="Binbash Leverage (info@binbash.com.ar)"

ARG AWSCLI_VERSION

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
        python3
RUN rm /var/cache/apk/*

# Install latest pip3 and AWS CLI
RUN python3 -m ensurepip && \
        python3 -m pip install --upgrade pip && \
        rm -r /usr/lib/python*/ensurepip && \
        pip3 install awscli==${AWSCLI_VERSION}

ENTRYPOINT ["terraform"]