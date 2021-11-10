.PHONY: help
.DEFAULT_GOAL := help

help: ## show help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build: ## docker-compose build
	@echo 'docker-compose build'
	@docker-compose build
server: ## docker-compose run --rm --name yaselabo_rails_1 -p 3000:3000 rails
	@echo 'docker-compose docker-compose run --rm --name yaselabo_rails_1 -p 3000:3000 rails'
	@docker-compose run --rm --name yaselabo_rails_1 -p 3000:3000 rails
delete: ## docker conrainer rm yaselabo_rails_1
	@echo 'docker container rm yaselabo_rails_1'
	@docker container rm yaselabo_rails_1
console: ## docker exec -it yaselabo_rails_1 /bin/bash
	@echo 'docker exec -it yaselabo_rails_1 /bin/bash'
	@docker exec -it -e COLUMNS=$COLUMNS -e LINES=$LINES -e TERM=$TERM yaselabo_rails_1 /bin/bash
dbconsole: ## docker exec -it yaselabo_db_1 /bin/bash
	@echo 'docker exec -it yaselabo_db_1 /bin/bash'
	@docker exec -it yaselabo_db_1 /bin/bash
redisconsole: ## docker exec -it yaselabo_redis_1 /bin/bash
	@echo 'docker exec -it yaselabo_redis_1 /bin/bash'
	@docker exec -it yaselabo_redis_1 /bin/bash
