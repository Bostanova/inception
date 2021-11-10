FROM alpine:3.12

RUN apk update
RUN apk add mariadb mariadb-common mariadb-client bash
VOLUME  ["/sys/fs/cgroup"]
ARG     SQL_DB
ARG     SQL_USER
ARG     SQL_PWD
ARG     SQL_ROOT
ARG     SQL_ROOT_PWD
RUN     chmod 755 /etc/my.cnf
RUN     echo "[mysqld]" > /etc/my.cnf; \
        echo "user=root" >> /etc/my.cnf; \
        echo "port=3306" >> /etc/my.cnf; \
        echo "datadir=/var/lib/mysql" >> /etc/my.cnf; \
        echo "skip-networking=false" >> /etc/my.cnf; \
        echo "bind-address=0.0.0.0" >> /etc/my.cnf
RUN     sed '/skip-networking/s/^/#/g' /etc/my.cnf.d/mariadb-server.cnf
COPY	mysql.sh   /
RUN     chmod +x /mysql.sh
RUN     mkdir -p /var/run/mysqld
RUN     chown mysql:mysql /var/run/mysqld
RUN     /mysql.sh
EXPOSE  3306
ENTRYPOINT [ "mysqld" ]
CMD [ "-u root" ]
