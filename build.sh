#!/bin/sh

cd /usr/local/src/mysql-4.0.30/
./configure --prefix=/usr/local/mysql --with-extra-charsets=complex
mkdir /usr/local/mysql \
      /usr/local/mysql/include \
      /usr/local/mysql/include/mysqlmkdir \
      /usr/local/mysql/lib \
      /usr/local/mysql/lib/mysql \
      /usr/local/mysql/share \
      /usr/local/mysql/man \
      /usr/local/mysql/mysql-test
# make && make test && make install
make && make install
