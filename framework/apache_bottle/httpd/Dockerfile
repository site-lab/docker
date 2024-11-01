FROM almalinux:9

RUN dnf -y install httpd
RUN dnf -y install python3-mod_wsgi 
RUN dnf -y install python-devel 
RUN dnf -y install python3-markupsafe && dnf -y install python3-pip
RUN pip  install feedparser

#メンテナンスツール導入
RUN dnf install -y vim-minimal.x86_64 \
    && yum install -y findutils.x86_64 \
    && yum install -y util-linux git

COPY ./httpd/httpd.conf /etc/httpd/conf/
COPY ./httpd/bottle.conf /etc/httpd/conf.d/
# OS起動時に自動起動(サービス起動)
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]