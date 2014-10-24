FROM ubuntu:12.04

RUN apt-get update
RUN apt-get install -y mysql-server-5.5

ADD ./my.cnf /etc/mysql/my.cnf
ADD ./configure_mysql /usr/local/bin/configure_mysql

RUN echo 'Europe/Paris' > /etc/timezone
RUN dpkg-reconfigure --frontend noninteractive tzdata

RUN /usr/local/bin/configure_mysql

EXPOSE 3306
CMD ["/usr/bin/mysqld_safe"]
