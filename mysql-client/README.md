# mysql-client

#### Docker image with a MySQL 5.6, 5.7 and 8.0 compatible client.

<div align="left">
    <img src="../figures/mysql.png" alt="drawing" width="250"/>
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

#### Execution example for: `make test-run-sql-file`
```
$ pwd
/home/delivery/Binbash/repos/BB-Leverage/docker/public-docker-images/mysql-client/example-test

$ make up
docker-compose -f "docker-compose-mysql-server.yml" up -d
Creating network "example-test_bb-mysql" with driver "bridge"
Creating example-test_mysql-server-8.0_1 ... done
Creating example-test_mysql-server-5.6_1 ... done
Creating example-test_mysql-server-5.7_1 ... done

$ make ps
docker-compose -f "docker-compose-mysql-server.yml" ps
             Name                            Command               State          Ports
----------------------------------------------------------------------------------------------
example-test_mysql-server-5.6_1   docker-entrypoint.sh mysqld      Up      3306/tcp
example-test_mysql-server-5.7_1   docker-entrypoint.sh mysqld      Up      3306/tcp, 33060/tcp
example-test_mysql-server-8.0_1   docker-entrypoint.sh --def ...   Up      3306/tcp, 33060/tcp

$ cd ..

$ make test-run-sql-file
docker run --rm --network "example-test_bb-mysql" -v /home/delivery/Binbash/repos/BB-Leverage/docker/public-docker-images/mysql-client/example-test:/sql --link "example-test_mysql-server-5.6_1":mysql -it binbash/mysql-client:v0.0.1 -h mysql -p"mysql_root_pass" -D "db_test" -e "source /sql/create_table.sql"; \
docker run --rm --network "example-test_bb-mysql" -v /home/delivery/Binbash/repos/BB-Leverage/docker/public-docker-images/mysql-client/example-test:/sql --link "example-test_mysql-server-5.7_1":mysql -it binbash/mysql-client:v0.0.1 -h mysql -p"mysql_root_pass" -D "db_test" -e "source /sql/create_table.sql"; \
docker run --rm --network "example-test_bb-mysql" -v /home/delivery/Binbash/repos/BB-Leverage/docker/public-docker-images/mysql-client/example-test:/sql --link "example-test_mysql-server-8.0_1":mysql -it binbash/mysql-client:v0.0.1 -h mysql -p"mysql_root_pass" -D "db_test" -e "source /sql/create_table.sql"
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

$ cd example-test

$ make down
docker-compose -f "docker-compose-mysql-server.yml" down
Stopping example-test_mysql-server-5.7_1 ... done
Stopping example-test_mysql-server-5.6_1 ... done
Stopping example-test_mysql-server-8.0_1 ... done
Removing example-test_mysql-server-5.7_1 ... done
Removing example-test_mysql-server-5.6_1 ... done
Removing example-test_mysql-server-8.0_1 ... done
Removing network example-test_bb-mysql
```

## Usage

Review the commands in `mysql-client/Makefile` to validate how to `build`, `run` and `push` this Dockerimage


