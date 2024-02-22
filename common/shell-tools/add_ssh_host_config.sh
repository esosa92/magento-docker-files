#!/bin/bash

SCRIPT_ABS_PATH=$(dirname $(realpath -s "$0"))

while getopts 'n:a:p:u:' OPT; do
  case $OPT in
  n) HOST_NAME=$OPTARG ;;
  a) HOST_ADDRESS=$OPTARG ;; #a stands for address
  p) HOST_PORT=$OPTARG ;;
  u) HOST_USER=$OPTARG ;;
  *) ;;
  esac
done

ABORT_SCRIPT=false

if [ -z "$HOST_NAME" ]; then
  echo provide a host name with the -n option
  ABORT_SCRIPT=true
fi

if [ -z "$HOST_ADDRESS" ]; then
  echo provide an address with the -a option
  ABORT_SCRIPT=true
fi

if [ -z "$HOST_PORT" ]; then
  echo provide a port with the -p option
  ABORT_SCRIPT=true
fi

if [ -z "$HOST_USER" ]; then
  echo provide an user  with the -u option
  ABORT_SCRIPT=true
fi

if $ABORT_SCRIPT; then
    echo "check the error messages and run again"
    exit 0
fi

CONFIG_SAMPLE_PATH="$SCRIPT_ABS_PATH/config.template"

HOST_REPLACE_STR="__host__"
HOST_ADDRESS_REPLACE_STR="__host_ip_address_or_dns"
HOST_PORT_REPLACE_STR="__port__"
HOST_USER_REPLACE_STR="__user__"

mkdir -p ~/.ssh/
touch ~/.ssh/config

sed "s/$HOST_REPLACE_STR/$HOST_NAME/" <"$CONFIG_SAMPLE_PATH" |
  sed "s/$HOST_ADDRESS_REPLACE_STR/$HOST_ADDRESS/" |
  sed "s/$HOST_PORT_REPLACE_STR/$HOST_PORT/" |
  sed "s/$HOST_USER_REPLACE_STR/$HOST_USER/" |
  tee -a ~/.ssh/config
