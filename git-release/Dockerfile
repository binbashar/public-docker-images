FROM golang:1.12-stretch

MAINTAINER Binbash Leverage (info@binbash.com.ar)

# sources vars
ARG PACKAGE_PATH_1="github.com/git-chglog/git-chglog/cmd/git-chglog"
ARG PACKAGE_PATH_2="https://github.com/pnikosis/semtag"

# git-chglog
RUN apt-get update && apt-get install -y --no-install-recommends git bash
RUN go get ${PACKAGE_PATH_1}

# semtag
RUN mkdir /opt/semtag && cd /opt/semtag && git clone ${PACKAGE_PATH_2}
RUN chmod 755 /opt/semtag/semtag

WORKDIR /data
ENTRYPOINT ["git-chglog"]