ARG MARIADB_VERSION=10.4.22
FROM mariadb:${MARIADB_VERSION}
LABEL Maintainer="github.com/xaabi6"
LABEL Description="MariaDB container with custom UID and GID for mysql user and group."

# Custom UID and GID. Use the same from the mysql user in the host machine.
ENV MYSQL_UID 108
ENV MYSQL_GID 996

RUN usermod -u $MYSQL_UID mysql; groupmod -g $MYSQL_GID mysql;

RUN chown -R mysql:mysql /var/lib/mysql /var/run/mysqld /var/log/mysql
