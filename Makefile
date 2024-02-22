#!/usr/bin/env bash

menu:
	@bash "entry" "menu"

setup:
	@bash "entry" "setup"

build:
	@bash "entry" "build"

start:
	@bash "entry" "start"

stop:
	@bash "entry" "stop"

create-env:
	@bash "entry" "create-env"

add-vhost:
	@bash "entry" "add-vhost"

add-host:
	@bash "entry" "add-host"

remove-host:
	@bash "entry" "remove-host"

add-ssh-config:
	@bash "entry" "add-ssh-config"

add-pub-key:
	@bash "entry" "add-pub-key"

docker-connect:
	@bash "entry" "docker-connect"
