FROM alpine:3.15

COPY ./scripts/daily/* /etc/periodic/daily

RUN apk add --no-cache mariadb-client=10.6.4-r2 && \
  chmod a+x /etc/periodic/daily/*
