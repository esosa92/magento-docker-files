#!/bin/bash

DB_USER="root"
DB_PW="root"

read -r -p "Enter sql you wish to import that is inside dbscripts: " SCRIPT_NAME
while [ -z "$SCRIPT_NAME" ]; do
  read -r -p "empty value, please enter it again: " SCRIPT_NAME
done

read -r -p "Enter the database name: " DB_NAME
while [ -z "$DB_NAME" ]; do
  read -r -p "empty value, please enter it again: " DB_NAME
done

read -r -p "Enter root password, leave empty for default pw(root): " USER_DB

if [ -z "$USER_DB" ]; then
  echo "using default password"
else
  DB_USER=$USER_DB
fi

if [ -f "./dbscripts/$SCRIPT_NAME" ]; then
  echo -e "$SCRIPT_NAME exists, proceeding to import..\n"
else
  echo "$SCRIPT_NAME does not exist. Aborting."
fi

echo $SCRIPT_NAME $DB_NAME $DB_USER $DB_PW
docker exec -it mariadb_104 pv dbscripts/"$SCRIPT_NAME" | mysql -u "$DB_USER" -p"$DB_PW" "$DB_NAME"
