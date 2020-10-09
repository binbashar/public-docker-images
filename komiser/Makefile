.PHONY: build
SHELL := /bin/bash

DOCKER_TAG := 2.4.0
DOCKER_IMG_NAME := komiser
DOCKER_IMG_PORT_KOMISER := 3000
DOCKER_IMG_PORT_REDIS := 6379
DOCKER_IMG_VER_REDIS := 5.0.6

DOCKER_CONT_NAME_REDIS := ${DOCKER_IMG_NAME}-redis
LOCAL_OS_AWS_CONF_DIR := ~/.aws/credentials.komiser
LOCAL_OS_URL_KOMISER := localhost:${DOCKER_IMG_PORT_KOMISER}

define REDIS_CMD_PREFIX
docker run -d \
--name ${DOCKER_CONT_NAME_REDIS} \
-p ${DOCKER_IMG_PORT_REDIS}:${DOCKER_IMG_PORT_REDIS} \
--network nw-${DOCKER_IMG_NAME}-redis \
redis:${DOCKER_IMG_VER_REDIS}
endef

define KOMISER_REDIS_CMD_PREFIX
docker run -d \
--name ${DOCKER_IMG_NAME} \
-p ${DOCKER_IMG_PORT_KOMISER}:${DOCKER_IMG_PORT_KOMISER} \
-v ${LOCAL_OS_AWS_CONF_DIR}:/root/.aws/credentials \
--network nw-${DOCKER_IMG_NAME}-redis \
mlabouardy/${DOCKER_IMG_NAME}:${DOCKER_TAG} --multiple --redis ${DOCKER_CONT_NAME_REDIS}:6379 --duration 30
endef

define KOMISER_CMD_PREFIX
docker run -d \
--name ${DOCKER_IMG_NAME} \
-p ${DOCKER_IMG_PORT_KOMISER}:${DOCKER_IMG_PORT_KOMISER} \
-v ${LOCAL_OS_AWS_CONF_DIR}:/root/.aws/credentials \
mlabouardy/${DOCKER_IMG_NAME}:${DOCKER_TAG} --multiple
endef

help:
	@echo 'Available Commands:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf " - \033[36m%-18s\033[0m %s\n", $$1, $$2}'

#===================================#
# DOCKER BASED EXEC                 #
#===================================#
test-run-docker-komiser: ## docker run komiser commands
	${KOMISER_CMD_PREFIX}
	@echo ""
	docker ps
	@echo ""
	make test-smoke-local

test-stop-docker-komiser: ## docker stop and remove docker containers and network
	docker stop ${DOCKER_IMG_NAME}
	docker rm ${DOCKER_IMG_NAME}

#===================================#
# DOCKER W/ REDIS BASED EXEC        #
#===================================#
test-run-docker-komiser-redis: ## docker run komiser commands
	docker network create -d bridge nw-${DOCKER_IMG_NAME}-redis
	${REDIS_CMD_PREFIX}
	${KOMISER_REDIS_CMD_PREFIX}
	@echo ""
	docker ps
	@echo ""
	docker network ls
	@echo ""
	make test-smoke-local

test-stop-docker-komiser-redis: ## docker stop and remove docker containers and network
	docker stop ${DOCKER_IMG_NAME} ${DOCKER_CONT_NAME_REDIS}
	docker rm ${DOCKER_IMG_NAME} ${DOCKER_CONT_NAME_REDIS}
	docker network rm nw-${DOCKER_IMG_NAME}-redis

#====================================#
# DOCKER-COMPOSE W/ REDIS BASED EXEC #
#====================================#
test-run-docker-compose-komiser-redis: ## docker-compose up komiser commands
	docker-compose up -d
	@echo ""
	docker-compose ps
	@echo ""
	make test-smoke-local

test-stop-docker-compose-komiser-redis: ## docker-compose stop and remove docker containers and network
	docker-compose stop
	docker-compose rm --force

#===================================#
# ENV SMOKE TEST 			        #
#===================================#
test-smoke-local: ## curl local smoke test
	@echo ""
	@echo "#-------------------------------------------------"
	@echo "#|                  APPS STATUS                  |"
	@echo "#-------------------------------------------------"

	@DEMO_ENV_ENDPOINT_URLS_APPS=( "${LOCAL_OS_URL_KOMISER}" );\
	for i in "$${DEMO_ENV_ENDPOINT_URLS_APPS[@]}"; do\
		echo "--------------------------------------------------";\
		echo " http://$$i STATUS RESPONSE CODE TEST |";\
		echo "--------------------------------------------------";\
		RC_APPS="$$(curl -o /dev/null --silent --head --write-out '%{http_code}\n' $$i | grep 200)";\
		echo "";\
		if [ "$$RC_APPS" == "200" ]; then\
			echo ==================================================;\
			echo " => http://$$i PASSED W/ $$RC_APPS!!!";\
			echo ==================================================;\
		else\
			echo ==================================================;\
			echo " => http://$$i FAILED!!!";\
			echo ==================================================;\
		fi;\
	done

test: test-run-docker-komiser test-stop-docker-komiser ## ci docker image tests
