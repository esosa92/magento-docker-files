#!/bin/bash

SCRIPT_ABS_PATH=$(dirname $(realpath -s "$0"))
GENERATE_DB_SERVER_SH_PATH="$SCRIPT_ABS_PATH/generate_db_in_server.sh"
DB_SCRIPTS_FOLDER_PATH="/dbscripts"

echo "E.G -p 2727 user@ipaddress OR project_integration (this last should reside in your ~/.ssh/config)"
echo "For more info of ~/.ssh/config, go here https://linuxize.com/post/using-the-ssh-config-file/"
echo "Enter host and user for ssh as well as port, but if you have a ~/.ssh/config file, you can just use the name: "
read -r HOST
echo "Lexicon server: \$HOME/public_html/shared/app/etc/env.php"
echo "Cloud server: \$HOME/app/etc/env.php"
read -r -p "Enter absolute path in server for env.php: " ENV_PHP_PATH

if [ -z "$HOST" ]; then
  echo "please enter a host"
  exit 0
fi

if [ -z "$ENV_PHP_PATH" ]; then
  echo "please enter a env.php path"
  exit 0
fi

echo "Starting generation of dump file, this may take a while"
DUMP_PATH="$(ssh $HOST "bash -s" "$ENV_PHP_PATH" <"$GENERATE_DB_SERVER_SH_PATH")"
echo "DB generated at $DUMP_PATH"
HOST=$(sed "s/-p/-P/" <<< "$HOST")
scp $HOST:"$DUMP_PATH" "$DB_SCRIPTS_FOLDER_PATH"
ssh $HOST "rm $DUMP_PATH"
