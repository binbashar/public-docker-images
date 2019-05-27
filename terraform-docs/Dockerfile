FROM golang:1.12-stretch

ARG PACKAGE_PATH="github.com/segmentio/terraform-docs"

RUN apt-get update && apt-get install -y --no-install-recommends git bash
RUN go get ${PACKAGE_PATH}

ENTRYPOINT ["terraform-docs"]