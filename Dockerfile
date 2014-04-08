FROM ubuntu:lucid
MAINTAINER K.Sasaki <among753@gmail.com>

#RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
#RUN apt-get upgrade -y

RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -nfs /bin/true /sbin/initctl

RUN apt-get -y install mysql-client-5.1
RUN apt-get -y install mysql-server-5.1

# 外部からの接続許可
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

ADD ./startup.sh /opt/startup.sh

EXPOSE 3306

# startup.sh mysqlpass
#ENTRYPOINT ["/bin/bash", "/opt/startup.sh"]
#CMD ["password"]

CMD ["/bin/bash", "/opt/startup.sh"]
