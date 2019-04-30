.PHONY: build
DOCKER_COMPOSE_FILE = "docker-compose-mysql-server.yml"

up:
	docker-compose -f ${DOCKER_COMPOSE_FILE} up -d

ps:
	docker-compose -f ${DOCKER_COMPOSE_FILE} ps

down:
	docker-compose -f ${DOCKER_COMPOSE_FILE} down