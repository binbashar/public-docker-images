FROM golang:latest

ARG TERRAFORM_VERSION

ENV TERRAFORM_VERSION $TERRAFORM_VERSION
RUN apt-get update && apt-get install -y --no-install-recommends unzip git bash openssl
RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && mv terraform /usr/local/go/bin/terraform

RUN go get github.com/gruntwork-io/terratest/modules/terraform
RUN go get -u github.com/golang/dep/cmd/dep

WORKDIR $GOPATH/src/github.com/gruntwork-io/terratest/modules/terraform

RUN go install
WORKDIR $GOPATH/src/project/

CMD ["version"]
ENTRYPOINT ["go"]