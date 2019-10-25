FROM debian:stretch-20190812-slim

MAINTAINER Binbash Leverage (info@binbash.com.ar)

ENV MYSQL_MAJOR 8.0
ENV MYSQL_VERSION 8.0.18-1debian9

RUN echo "deb http://repo.mysql.com/apt/debian/ stretch mysql-${MYSQL_MAJOR}" > /etc/apt/sources.list.d/mysql.list
RUN apt-get update && apt-get install -y --allow-unauthenticated mysql-community-client="${MYSQL_VERSION}"

ENTRYPOINT ["mysql"]