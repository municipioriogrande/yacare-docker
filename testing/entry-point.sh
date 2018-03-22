#!/bin/bash

cd /root/yacare
cp /root/parameters.yml /root/yacare/app/config/

composer config --global github-oauth.github.com $GITHUB_TOKEN

composer install
php bin/console doctrine:schema:update --force --env=test

# Update codeception helpers
php vendor/codeception/codeception/codecept build

exec "$@"
