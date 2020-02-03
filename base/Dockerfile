# Contains all dependencies needed to run Yacare everywhere.
FROM centos:7
LABEL maintainer="Municipio Río Grande <tic.desarrollo@riogrande.gob.ar>"

# Install Remi, EPEL repos and yum-utils
RUN yum install -y wget && \
    wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    wget http://rpms.remirepo.net/enterprise/remi-release-7.rpm && \
    rpm -Uvh remi-release-7.rpm epel-release-latest-7.noarch.rpm

# Install and configure yum-utils
RUN yum install -y yum-utils && \
    yum-config-manager --enable remi-php74

# Install misc dependencies
RUN yum install -y unzip

# Install Oracle client
RUN curl https://s3-sa-east-1.amazonaws.com/munirg-yacare/oracle-instantclient.rpm --output /oracle-instantclient.rpm && \
    yum install -y /oracle-instantclient.rpm
ENV LD_LIBRARY_PATH /usr/lib/oracle/12.2/client64/lib

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
    php-intl \
    php-xdebug

# Install and set composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    mv composer.phar /usr/bin/composer
