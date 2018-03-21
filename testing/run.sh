#!/bin/sh

docker-compose -p yacaretesting run --rm yacare php /root/yacare/vendor/codeception/codeception/codecept run functional Yacare/Codi
