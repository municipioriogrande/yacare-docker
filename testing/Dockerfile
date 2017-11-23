# Contains all dependencies needed to run Yacare.
FROM centos:7
LABEL maintainer="Carlos Frias <carlos.a.frias@gmail.com>"

# Install Remi, EPEL repos and yum-utils
RUN yum install -y \
    https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
    http://rpms.remirepo.net/enterprise/remi-release-7.rpm

# Install and configure yum-utils
RUN yum install -y yum-utils && \
    yum-config-manager --enable remi-php71

# Install misc dependencies
RUN yum install -y unzip

# Install PHP and PHP extensions
RUN yum install -y \
    php \
    php-zip \
    php-common \
    php-gd \
    php-ldap \
    php-pdo \
    php-mysqlnd \
    php-mbstring \
    php-oci8 \
    php-process \
    php-xml \
    php-intl

# Install and set composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    mv composer.phar /usr/bin/composer

# Install MariaDB and configure it
COPY data/MariaDB.repo /etc/yum.repos.d/MariaDB.repo
RUN yum install -y MariaDB-server MariaDB-client
RUN /etc/init.d/mysql start

COPY data/yacatest.sql /yacatest.sql

# Install Oracle client
COPY lib/oracle-instantclient.rpm /
RUN yum install -y /oracle-instantclient.rpm
ENV LD_LIBRARY_PATH /usr/lib/oracle/12.2/client64/lib

# Run entrypoint script
COPY entry-point.sh /
ENTRYPOINT ["sh", "/entry-point.sh"]