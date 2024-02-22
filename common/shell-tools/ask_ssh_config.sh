#!/bin/bash

SCRIPT_ABS_PATH=$(dirname $(realpath -s "$0"))

read -r -p "Enter a hostname: " HOST_NAME
read -r -p "Enter the remote server address: " ADDRESS
read -r -p "Enter the remote server port[22]: " PORT
read -r -p "Enter the remote server user: " USER

PORT=${PORT:-22}

/bin/bash "$SCRIPT_ABS_PATH/add_ssh_host_config.sh" -n "$HOST_NAME" -a "$ADDRESS" -p "$PORT" -u "$USER"
