FROM alpine:3.15

COPY ./scripts/daily/* /etc/periodic/daily

RUN apk update && \
  apk upgrade && \
  apk add --no-cache mariadb-client && \
  chmod a+x /etc/periodic/daily/*
