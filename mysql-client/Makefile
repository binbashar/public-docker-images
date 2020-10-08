.PHONY: build

SHELL            := /bin/bash
MAKEFILE_PATH    := ./Makefile
MAKEFILES_DIR    := ../@bin/makefiles

DOCKER_TAG       := 0.0.2
DOCKER_REPO_NAME := binbash
DOCKER_IMG_NAME  := mysql-client

MYSQ_SQL_FILE = create_table.sql
MYSQL_PATH_TO_SQL = $(shell pwd)/example-test
MYSQL_CONT_NQME_5.6 = "example-test_mysql-server-5.6_1"
MYSQL_CONT_NQME_5.7 = "example-test_mysql-server-5.7_1"
MYSQL_CONT_NQME_8.0 = "example-test_mysql-server-8.0_1"
MYSQL_ROOT_PASS = "mysql_root_pass"
MYSQL_ROOT_USER = "root"
MYSQL_DATABASE = "db_test"
MYSQL_COMMAND = "show databases;"
MYSQL_DOCKER_NW = "example-test_bb-mysql"

# Consider incrementing this sleep time if you get -> ERROR 2003 (HY000): Can't connect to MySQL server on 'mysql' (111)
# most probably MySql Server container it's not up & running before you try to connect to it.
MYSQL_BOOTSTRAP_SLEEP = "15"

help:
	@echo 'Available Commands:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf " - \033[36m%-18s\033[0m %s\n", $$1, $$2}'

#==============================================================#
# INITIALIZATION                                               #
#==============================================================#
init-makefiles: ## initialize makefiles
	rm -rf ${MAKEFILES_DIR}
	mkdir -p ${MAKEFILES_DIR}
	git clone https://github.com/binbashar/le-dev-makefiles.git ${MAKEFILES_DIR}

-include ${MAKEFILES_DIR}/docker/docker-hub-build-push.mk

test-run-ver: ## run docker image test-1
	docker run --rm -it binbash/mysql-client:${DOCKER_TAG} -V

test-run-sql-file: ## run docker image test-2
	docker-compose -f ${MYSQL_PATH_TO_SQL}/docker-compose.yml up -d
	sleep ${MYSQL_BOOTSTRAP_SLEEP}
	docker run --rm --network ${MYSQL_DOCKER_NW} -v ${MYSQL_PATH_TO_SQL}:/sql --link ${MYSQL_CONT_NQME_5.6}:mysql -it binbash/mysql-client:${DOCKER_TAG} -h mysql -p${MYSQL_ROOT_PASS} -D ${MYSQL_DATABASE} -e "source /sql/${MYSQ_SQL_FILE}"; \
	docker run --rm --network ${MYSQL_DOCKER_NW} -v ${MYSQL_PATH_TO_SQL}:/sql --link ${MYSQL_CONT_NQME_5.7}:mysql -it binbash/mysql-client:${DOCKER_TAG} -h mysql -p${MYSQL_ROOT_PASS} -D ${MYSQL_DATABASE} -e "source /sql/${MYSQ_SQL_FILE}"; \
	docker run --rm --network ${MYSQL_DOCKER_NW} -v ${MYSQL_PATH_TO_SQL}:/sql --link ${MYSQL_CONT_NQME_8.0}:mysql -it binbash/mysql-client:${DOCKER_TAG} -h mysql -p${MYSQL_ROOT_PASS} -D ${MYSQL_DATABASE} -e "source /sql/${MYSQ_SQL_FILE}"
	docker-compose -f ${MYSQL_PATH_TO_SQL}/docker-compose.yml stop
	docker-compose -f ${MYSQL_PATH_TO_SQL}/docker-compose.yml rm --force
	docker volume rm example-test_database_data_5.6 example-test_database_data_5.7 example-test_database_data_8.0 --force

test-run-sql-cmd: ## run docker image test-3
	docker-compose -f ${MYSQL_PATH_TO_SQL}/docker-compose.yml up -d
	sleep ${MYSQL_BOOTSTRAP_SLEEP}
	docker run --rm --network ${MYSQL_DOCKER_NW} --link ${MYSQL_CONT_NQME_5.6}:mysql -it binbash/mysql-client:${DOCKER_TAG} -h mysql -u root -p${MYSQL_ROOT_PASS} -e ${MYSQL_COMMAND}; \
	docker run --rm --network ${MYSQL_DOCKER_NW} --link ${MYSQL_CONT_NQME_5.7}:mysql -it binbash/mysql-client:${DOCKER_TAG} -h mysql -u root -p${MYSQL_ROOT_PASS} -e ${MYSQL_COMMAND}; \
	docker run --rm --network ${MYSQL_DOCKER_NW} --link ${MYSQL_CONT_NQME_8.0}:mysql -it binbash/mysql-client:${DOCKER_TAG} -h mysql -u root -p${MYSQL_ROOT_PASS} -e ${MYSQL_COMMAND}
	docker-compose -f ${MYSQL_PATH_TO_SQL}/docker-compose.yml stop
	docker-compose -f ${MYSQL_PATH_TO_SQL}/docker-compose.yml rm --force
	docker volume rm example-test_database_data_5.6 example-test_database_data_5.7 example-test_database_data_8.0 --force

