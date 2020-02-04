#!/bin/bash

cd /root/yacare
cp /root/parameters.yml /root/yacare/app/config/
cp /root/.env.test /root/yacare/.env.test


composer config extra.symfony.allow-contrib true
composer config --global github-oauth.github.com $GITHUB_TOKEN

composer install --no-interaction
php bin/console doctrine:schema:update --force --env=test

# Update codeception helpers
php vendor/codeception/codeception/codecept build

exec "$@"
