#!/usr/bin/env bash

run: ## Start the containers
	@docker compose up -d

stop: ## Stop the containers
	@docker compose stop

down: ## Destroy containers
	@docker compose down

get-db:
	@/bin/bash shell-tools/get_db.sh

import-db:
	@/bin/bash shell-tools/import.sh
