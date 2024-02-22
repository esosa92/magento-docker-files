#!/bin/bash

UID = $(shell id -u)

image-build: ## builds the image for AMD64 processors
	@docker build \
			--build-arg UID=${UID} \
			--build-arg IS_ARM=false \
			-t php-magento:8.2-composer-2.2 .

image-build-arm: ## builds the image for ARM processors
	@docker build \
		--build-arg UID=${UID} \
		--build-arg IS_ARM=true \
		-t php-magento:8.2-composer-2.2 .
