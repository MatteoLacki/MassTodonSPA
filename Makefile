
developBuild: ## Build with a watcher
	- webpack -w
	# - htpt-server . -p random_unused_port

testBuild: ## Build a test version with a debug output
	- webpack

prodBuild: ## build a prod version
	- webpack -p

upload: ## Upload a build with a stuff coded in an uploader
	- coffee ./tooling/upload.coffee

# Scripts
.PHONY: help
.DEFAULT_GOAL := help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
