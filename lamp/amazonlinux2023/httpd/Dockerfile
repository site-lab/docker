FROM amazonlinux:2023

RUN dnf -y install httpd

#RUN yum -y install nginx vim-minimal.x86_64 findutils.x86_64 && \
#    rpm -ivh http://nginx.org/packages/rhel/7/noarch/RPMS/nginx-release-rhel-7-0.el7.ngx.noarch.rpm && \
#    ln -snf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
#メンテナンスツール導入
RUN dnf install -y vim-minimal.x86_64 \
    && yum install -y findutils.x86_64 \
    && yum install -y util-linux git

RUN echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock
RUN rm -f /etc/localtime
RUN ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
COPY ./httpd/httpd.conf /etc/httpd/conf/
# OS起動時に自動起動(サービス起動)
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]