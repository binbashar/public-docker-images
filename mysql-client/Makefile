.PHONY: build
DOCKER_TAG = 0.0.1
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

help:
	@echo 'Available Commands:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf " - \033[36m%-18s\033[0m %s\n", $$1, $$2}'

build: # build docker image
	docker build -t binbash/mysql-client:${DOCKER_TAG} -t binbash/mysql-client:latest .

build-no-cache: # build docker image no cache
	docker build --no-cache -t binbash/mysql-client:${DOCKER_TAG} -t binbash/mysql-client:latest .

test-run-ver: # run docker image test-1
	docker run --rm -it binbash/mysql-client:${DOCKER_TAG} -V

test-run-sql-cmd: # run docker image test-2
	docker run --rm --network ${MYSQL_DOCKER_NW} --link ${MYSQL_CONT_NQME_5.6}:mysql -it binbash/mysql-client:${DOCKER_TAG} -h mysql -u root -p${MYSQL_ROOT_PASS} -e ${MYSQL_COMMAND}; \
	docker run --rm --network ${MYSQL_DOCKER_NW} --link ${MYSQL_CONT_NQME_5.7}:mysql -it binbash/mysql-client:${DOCKER_TAG} -h mysql -u root -p${MYSQL_ROOT_PASS} -e ${MYSQL_COMMAND}; \
	docker run --rm --network ${MYSQL_DOCKER_NW} --link ${MYSQL_CONT_NQME_8.0}:mysql -it binbash/mysql-client:${DOCKER_TAG} -h mysql -u root -p${MYSQL_ROOT_PASS} -e ${MYSQL_COMMAND}


test-run-sql-file: # run docker image test-3
	docker run --rm --network ${MYSQL_DOCKER_NW} -v ${MYSQL_PATH_TO_SQL}:/sql --link ${MYSQL_CONT_NQME_5.6}:mysql -it binbash/mysql-client:${DOCKER_TAG} -h mysql -p${MYSQL_ROOT_PASS} -D ${MYSQL_DATABASE} -e "source /sql/${MYSQ_SQL_FILE}"; \
	docker run --rm --network ${MYSQL_DOCKER_NW} -v ${MYSQL_PATH_TO_SQL}:/sql --link ${MYSQL_CONT_NQME_5.7}:mysql -it binbash/mysql-client:${DOCKER_TAG} -h mysql -p${MYSQL_ROOT_PASS} -D ${MYSQL_DATABASE} -e "source /sql/${MYSQ_SQL_FILE}"; \
	docker run --rm --network ${MYSQL_DOCKER_NW} -v ${MYSQL_PATH_TO_SQL}:/sql --link ${MYSQL_CONT_NQME_8.0}:mysql -it binbash/mysql-client:${DOCKER_TAG} -h mysql -p${MYSQL_ROOT_PASS} -D ${MYSQL_DATABASE} -e "source /sql/${MYSQ_SQL_FILE}"

push: # push docker image to registry
	docker push binbash/mysql-client:${DOCKER_TAG}  && docker push binbash/mysql-client:latest
