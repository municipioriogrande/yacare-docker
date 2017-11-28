#!/bin/bash

cd /yacare
mv /parameters.yml app/config
export SYMFONY_ENV=test
composer install
php bin/console doctrine:schema:update --force --env=test

exec "$@"
