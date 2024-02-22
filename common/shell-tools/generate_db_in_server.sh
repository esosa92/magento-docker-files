#!/bin/bash

ENV_PHP_PATH=$1

DN="$(grep "[\']db[\']" -A 20 "$ENV_PHP_PATH" |
  grep "dbname" | head -n1 | sed "s/.*[=][>][ ]*[']//" | sed "s/['][,]//")"
DH="$(grep "[\']db[\']" -A 20 "$ENV_PHP_PATH" |
  grep "host" | head -n1 | sed "s/.*[=][>][ ]*[']//" | sed "s/['][,]//")"
DU="$(grep "[\']db[\']" -A 20 "$ENV_PHP_PATH" |
  grep "username" | head -n1 | sed "s/.*[=][>][ ]*[']//" | sed "s/['][,]//")"
DPW="$(grep "[\']db[\']" -A 20 "$ENV_PHP_PATH" |
  grep "password" | head -n1 | sed "s/.*[=][>][ ]*[']//" | sed "s/[']$//" | sed "s/['][,]//")"
export DN
export DH
export DU
export DPW
FILENAME="/tmp/db.$DN.$(date +"%d-%m-%y").$((1 + $RANDOM % 100000)).sql.gz"
mysqldump -P 3304 -h $DH -u $DU --password=$DPW $DN --single-transaction |
  sed -e 's/DEFINER[ ]*=[ ]*[^*]*\*/\*/' |
  gzip >"$FILENAME"
echo "$FILENAME"
