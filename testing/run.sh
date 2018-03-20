#!/bin/sh

docker-compose -p yacare-testing run --rm yacare php /home/test/yacare/vendor/codeception/codeception/codecept run
