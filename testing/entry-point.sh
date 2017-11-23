#!/bin/bash

/etc/init.d/mysql start
mysql -u root << EOF
CREATE DATABASE yacadev;
CREATE DATABASE yacatest;
GRANT ALL PRIVILEGES ON yacadev.* TO yacadev@'localhost' IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON yacatest.* TO yacatest@'localhost' IDENTIFIED BY '123456';
EOF
mysql -u root yacatest < /yacatest.sql
composer install
php bin/console doctrine:schema:update --force --env=test

exec "$@"
