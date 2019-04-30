.PHONY: build
DOCKER_TAG = v0.0.1
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

build:
	docker build -t binbash/mysql-client:${DOCKER_TAG} -t binbash/mysql-client:latest .

build-no-cache:
	docker build --no-cache -t binbash/mysql-client:${DOCKER_TAG} -t binbash/mysql-client:latest .

test-run-ver:
	docker run --rm -it binbash/mysql-client:${DOCKER_TAG} -V

test-run-sql-cmd:
	docker run --rm --network ${MYSQL_DOCKER_NW} --link ${MYSQL_CONT_NQME_5.6}:mysql -it binbash/mysql-client:${DOCKER_TAG} -h mysql -u root -p${MYSQL_ROOT_PASS} -e ${MYSQL_COMMAND}; \
	docker run --rm --network ${MYSQL_DOCKER_NW} --link ${MYSQL_CONT_NQME_5.7}:mysql -it binbash/mysql-client:${DOCKER_TAG} -h mysql -u root -p${MYSQL_ROOT_PASS} -e ${MYSQL_COMMAND}; \
	docker run --rm --network ${MYSQL_DOCKER_NW} --link ${MYSQL_CONT_NQME_8.0}:mysql -it binbash/mysql-client:${DOCKER_TAG} -h mysql -u root -p${MYSQL_ROOT_PASS} -e ${MYSQL_COMMAND}


test-run-sql-file:
	docker run --rm --network ${MYSQL_DOCKER_NW} -v ${MYSQL_PATH_TO_SQL}:/sql --link ${MYSQL_CONT_NQME_5.6}:mysql -it binbash/mysql-client:${DOCKER_TAG} -h mysql -p${MYSQL_ROOT_PASS} -D ${MYSQL_DATABASE} -e "source /sql/${MYSQ_SQL_FILE}"; \
	docker run --rm --network ${MYSQL_DOCKER_NW} -v ${MYSQL_PATH_TO_SQL}:/sql --link ${MYSQL_CONT_NQME_5.7}:mysql -it binbash/mysql-client:${DOCKER_TAG} -h mysql -p${MYSQL_ROOT_PASS} -D ${MYSQL_DATABASE} -e "source /sql/${MYSQ_SQL_FILE}"; \
	docker run --rm --network ${MYSQL_DOCKER_NW} -v ${MYSQL_PATH_TO_SQL}:/sql --link ${MYSQL_CONT_NQME_8.0}:mysql -it binbash/mysql-client:${DOCKER_TAG} -h mysql -p${MYSQL_ROOT_PASS} -D ${MYSQL_DATABASE} -e "source /sql/${MYSQ_SQL_FILE}"

push:
	docker push binbash/mysql-client:${DOCKER_TAG}  && docker push binbash/mysql-client:latest
