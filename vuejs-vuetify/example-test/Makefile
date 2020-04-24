.PHONY: build
DOCKER_UP_SLEEP = "5"

help:
	@echo 'Available Commands:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf " - \033[36m%-18s\033[0m %s\n", $$1, $$2}'

#
# docker run tests
#
test-yarn-run-serve: ## docker run yarn serve
	cp ../Dockerfile Dockerfile
	docker-compose build --no-cache
	docker-compose up -d
	@sleep ${DOCKER_UP_SLEEP}
	@echo ""
	@echo "WEBSERVER HTTP STATUS CODE:"
	@bash -c "curl -o /dev/null --silent --head --write-out '%{http_code}\n' 127.0.0.1:8080 | grep 200"
	@echo ""
	docker-compose stop
	docker-compose rm --force
	
test-yarn-build-nginx: ## docker run yarn build + nginx container
	cp ../Dockerfile Dockerfile
	docker-compose -f docker-compose-prd.yaml build --no-cache
	docker-compose -f docker-compose-prd.yaml up -d
	@sleep ${DOCKER_UP_SLEEP}
	@echo ""
	@echo "WEBSERVER HTTP STATUS CODE:"
	@bash -c "curl -o /dev/null --silent --head --write-out '%{http_code}\n' 127.0.0.1:80 | grep 200"
	@echo ""
	docker-compose -f docker-compose-prd.yaml stop
	docker-compose -f docker-compose-prd.yaml rm --force

