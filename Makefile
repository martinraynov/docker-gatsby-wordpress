M = $(shell printf "\033[34;1m▶\033[0m")

.PHONY: help
help: ## Prints this help message
	@grep -E '^[a-zA-Z_-]+:.?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

######################
### MAIN FUNCTIONS ###
######################

.PHONY: start
start: ## Start the Gatsby + Wordpress env
	$(info $(M) Starting an instance of Gatsby&Wordpress)
	@docker stack rm gatsby_wordpress
	@docker stack deploy -c ./docker/docker-compose-swarm.yml gatsby_wordpress


.PHONY: stop
stop: ## Stop the Gatsby + Wordpress env
	$(info $(M) Stopping Gatsby&Wordpress instance)
	@docker stack rm gatsby_wordpress

.DEFAULT_GOAL := help
