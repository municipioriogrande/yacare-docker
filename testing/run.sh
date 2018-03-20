#!/bin/sh

docker-compose -p yacaretesting run --rm yacare php /home/test/yacare/vendor/codeception/codeception/codecept run
