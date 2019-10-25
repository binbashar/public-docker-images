# mysql-client

#### Docker image with a MySQL 5.6, 5.7 and 8.0 compatible client.

<div align="left">
    <img src="https://raw.githubusercontent.com/binbashar/public-docker-images/master/figures/mysql.png" alt="drawing" width="250"/>
</div>

[https://www.mysql.com/](https://www.mysql.com/).



This Docker image is based on Debian Stretch (slim).

Mysql client version:
```
$ make test-run-ver
docker run --rm -it binbash/mysql-client:15.1 -V
mysql  Ver 8.0.16 for Linux on x86_64 (MySQL Community Server - GPL)
```

## Tests

You must run `example-test/Makefile`  related commands in order to get the `docker-compose` based local-env before running any of the `test-.*` in the mysql-client root context folder **Makefile** commands:
- `test-run-ver`
- `test-run-sql-cmd`
- `test-run-sql-file`

#### Execution example for: `make test-run-sql-cmd`
```bash
╭─delivery at delivery-I7567 in ~/Binbash/repos/BB-Leverage/docker/public-docker-images/mysql-client on BBL-137-docker-scoutsuite-awscli-komiser✔ using ‹› 19-10-25 - 16:36:03
╰─○ make
Available Commands:
 - build              build docker image
 - build-no-cache     build docker image no cache
 - push               push docker image to registry
 - test-run-sql-cmd   run docker image test-3
 - test-run-sql-file  run docker image test-2
 - test-run-ver       run docker image test-1

╭─delivery at delivery-I7567 in ~/Binbash/repos/BB-Leverage/docker/public-docker-images/mysql-client on BBL-137-docker-scoutsuite-awscli-komiser✔ using ‹› 19-10-25 - 16:36:04
╰─○ make test-run-sql-cmd
docker-compose -f /home/delivery/Binbash/repos/BB-Leverage/docker/public-docker-images/mysql-client/example-test/docker-compose.yml up -d
Creating volume "example-test_database_data_5.6" with local driver
Creating volume "example-test_database_data_5.7" with local driver
Creating volume "example-test_database_data_8.0" with local driver
Creating example-test_mysql-server-5.6_1 ... done
Creating example-test_mysql-server-8.0_1 ... done
Creating example-test_mysql-server-5.7_1 ... done
sleep "15"
docker run --rm --network "example-test_bb-mysql" --link "example-test_mysql-server-5.6_1":mysql -it binbash/mysql-client:0.0.1 -h mysql -u root -p"mysql_root_pass" -e "show databases;"; \
docker run --rm --network "example-test_bb-mysql" --link "example-test_mysql-server-5.7_1":mysql -it binbash/mysql-client:0.0.1 -h mysql -u root -p"mysql_root_pass" -e "show databases;"; \
docker run --rm --network "example-test_bb-mysql" --link "example-test_mysql-server-8.0_1":mysql -it binbash/mysql-client:0.0.1 -h mysql -u root -p"mysql_root_pass" -e "show databases;"
mysql: [Warning] Using a password on the command line interface can be insecure.
+--------------------+
| Database           |
+--------------------+
| information_schema |
| db_test            |
| mysql              |
| performance_schema |
+--------------------+
mysql: [Warning] Using a password on the command line interface can be insecure.
+--------------------+
| Database           |
+--------------------+
| information_schema |
| db_test            |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
mysql: [Warning] Using a password on the command line interface can be insecure.
+--------------------+
| Database           |
+--------------------+
| db_test            |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
docker-compose -f /home/delivery/Binbash/repos/BB-Leverage/docker/public-docker-images/mysql-client/example-test/docker-compose.yml stop
Stopping example-test_mysql-server-5.7_1 ... done
Stopping example-test_mysql-server-5.6_1 ... done
Stopping example-test_mysql-server-8.0_1 ... done
docker-compose -f /home/delivery/Binbash/repos/BB-Leverage/docker/public-docker-images/mysql-client/example-test/docker-compose.yml rm --force
Going to remove example-test_mysql-server-5.7_1, example-test_mysql-server-5.6_1, example-test_mysql-server-8.0_1
Removing example-test_mysql-server-5.7_1 ... done
Removing example-test_mysql-server-5.6_1 ... done
Removing example-test_mysql-server-8.0_1 ... done
docker volume rm example-test_database_data_5.6 example-test_database_data_5.7 example-test_database_data_8.0 --force
example-test_database_data_5.6
example-test_database_data_5.7
example-test_database_data_8.0
```

#### Execution example for: `make test-run-sql-file`
```bash
╭─delivery at delivery-I7567 in ~/Binbash/repos/BB-Leverage/docker/public-docker-images/mysql-client on BBL-137-docker-scoutsuite-awscli-komiser✘✘✘ using ‹› 19-10-25 - 16:37:13
╰─○ make
Available Commands:
 - build              build docker image
 - build-no-cache     build docker image no cache
 - push               push docker image to registry
 - test-run-sql-cmd   run docker image test-3
 - test-run-sql-file  run docker image test-2
 - test-run-ver       run docker image test-1

╭─delivery at delivery-I7567 in ~/Binbash/repos/BB-Leverage/docker/public-docker-images/mysql-client on BBL-137-docker-scoutsuite-awscli-komiser✘✘✘ using ‹› 19-10-25 - 16:37:14
╰─○ make test-run-sql-file
docker-compose -f /home/delivery/Binbash/repos/BB-Leverage/docker/public-docker-images/mysql-client/example-test/docker-compose.yml up -d
Creating volume "example-test_database_data_5.6" with local driver
Creating volume "example-test_database_data_5.7" with local driver
Creating volume "example-test_database_data_8.0" with local driver
Creating example-test_mysql-server-5.7_1 ... done
Creating example-test_mysql-server-8.0_1 ... done
Creating example-test_mysql-server-5.6_1 ... done
sleep "15"
docker run --rm --network "example-test_bb-mysql" -v /home/delivery/Binbash/repos/BB-Leverage/docker/public-docker-images/mysql-client/example-test:/sql --link "example-test_mysql-server-5.6_1":mysql -it binbash/mysql-client:0.0.1 -h mysql -p"mysql_root_pass" -D "db_test" -e "source /sql/create_table.sql"; \
docker run --rm --network "example-test_bb-mysql" -v /home/delivery/Binbash/repos/BB-Leverage/docker/public-docker-images/mysql-client/example-test:/sql --link "example-test_mysql-server-5.7_1":mysql -it binbash/mysql-client:0.0.1 -h mysql -p"mysql_root_pass" -D "db_test" -e "source /sql/create_table.sql"; \
docker run --rm --network "example-test_bb-mysql" -v /home/delivery/Binbash/repos/BB-Leverage/docker/public-docker-images/mysql-client/example-test:/sql --link "example-test_mysql-server-8.0_1":mysql -it binbash/mysql-client:0.0.1 -h mysql -p"mysql_root_pass" -D "db_test" -e "source /sql/create_table.sql"
mysql: [Warning] Using a password on the command line interface can be insecure.
+--------------------+
| Database           |
+--------------------+
| information_schema |
| db_test            |
| mysql              |
| performance_schema |
+--------------------+
+-------------------+
| Tables_in_db_test |
+-------------------+
| tbl_user          |
+-------------------+
mysql: [Warning] Using a password on the command line interface can be insecure.
+--------------------+
| Database           |
+--------------------+
| information_schema |
| db_test            |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
+-------------------+
| Tables_in_db_test |
+-------------------+
| tbl_user          |
+-------------------+
mysql: [Warning] Using a password on the command line interface can be insecure.
+--------------------+
| Database           |
+--------------------+
| db_test            |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
+-------------------+
| Tables_in_db_test |
+-------------------+
| tbl_user          |
+-------------------+
docker-compose -f /home/delivery/Binbash/repos/BB-Leverage/docker/public-docker-images/mysql-client/example-test/docker-compose.yml stop
Stopping example-test_mysql-server-8.0_1 ... done
Stopping example-test_mysql-server-5.6_1 ... done
Stopping example-test_mysql-server-5.7_1 ... done
docker-compose -f /home/delivery/Binbash/repos/BB-Leverage/docker/public-docker-images/mysql-client/example-test/docker-compose.yml rm --force
Going to remove example-test_mysql-server-8.0_1, example-test_mysql-server-5.6_1, example-test_mysql-server-5.7_1
Removing example-test_mysql-server-8.0_1 ... done
Removing example-test_mysql-server-5.6_1 ... done
Removing example-test_mysql-server-5.7_1 ... done
docker volume rm example-test_database_data_5.6 example-test_database_data_5.7 example-test_database_data_8.0 --force
example-test_database_data_5.6
example-test_database_data_5.7
example-test_database_data_8.0
```

## Usage

Review the commands in `mysql-client/Makefile` to validate how to `build`, `run` and `push` this Docker image


