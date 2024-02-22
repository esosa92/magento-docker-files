#!/bin/bash

UID = $(shell id -u)

image-build:
	@docker build --build-arg UID=${UID} -t mariadb-custom:10.7 .
