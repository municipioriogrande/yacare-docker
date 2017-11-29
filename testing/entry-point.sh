#!/bin/bash

cd /home/test/yacare
mv -f /home/test/parameters.yml app/config
composer install
php bin/console doctrine:schema:update --force --env=test

exec "$@"
