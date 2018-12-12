FROM centos:6.6

RUN yum update -y; yum install -y bison compat-gcc-34-c++ gcc-c++ make ncurses-devel patch

ADD mysql-4.0.27.tar.gz /usr/local/src
ADD my_thr_init.c.patch /usr/local/src
COPY build.sh /tmp/build.sh
RUN chmod +x /tmp/build.sh
RUN /tmp/build.sh

ENV PATH /usr/local/mysql/bin:$PATH
ENV MYSQLDATA /usr/local/mysql/var
VOLUME /usr/local/mysql/var

COPY my.cnf /etc/my.cnf
RUN groupadd -r mysql && useradd -r -g mysql mysql
RUN chown -R root /usr/local/mysql && chown -R mysql /usr/local/mysql/var && chgrp -R mysql /usr/local/mysql

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

EXPOSE 3306

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["mysqld_safe"]
