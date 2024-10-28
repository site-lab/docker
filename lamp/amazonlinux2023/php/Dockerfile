FROM amazonlinux:2023

#RUN dnf -y update

RUN yum -y install vim-minimal.x86_64 findutils.x86_64 && \
    rpm -ivh http://nginx.org/packages/rhel/7/noarch/RPMS/nginx-release-rhel-7-0.el7.ngx.noarch.rpm && \
    ln -snf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

#メンテナンスツール導入
RUN yum install -y vim-minimal.x86_64 \
    && yum install -y findutils.x86_64 \
    && yum install -y util-linux

RUN dnf install -y php php-fpm  php-pgsql php-json php-devel php-gd git g++ php-pear libzip libzip-devel php-intl git zip unzip php-cli
#RUN dnf install -y php-pgsql php-json php-devel php-gd git g++ php-pear libzip libzip-devel php-intl
RUN mkdir -p /run/php-fpm
COPY ../php/www.conf /etc/php-fpm.d/www.conf

# composerをインストールしておく
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

