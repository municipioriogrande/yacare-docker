#!/bin/bash

cd /home/test/yacare
cp -f /home/test/parameters.yml app/config
composer install
php bin/console doctrine:schema:update --force --env=test

# Update codeception helpers
# echo "User: $USER. Username: $USERNAME"
# /home/test/yacare/vendor/codeception/codeception/codecept build

exec "$@"
