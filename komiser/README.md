# komiser

<div align="left">
  <img src="https://raw.githubusercontent.com/binbashar/public-docker-images/master/komiser/figures/komiser-logo.png" alt="leverage-circleci" width="120"/>
</div>

#### The AWS Command Line Interface (CLI) is a unified tool to manage your AWS services.

With just one tool to download and configure, you can control multiple AWS services from the command line and automate them through scripts.

The AWS CLI introduces a new set of simple file commands for efficient file transfers to and from Amazon S3.

<div align="left">
  <img src="https://raw.githubusercontent.com/binbashar/public-docker-images/master/komiser/figures/komiser-dashboard.png" alt="leverage-circleci" width="1000"/>
</div>

**Official Doc Link:**

- **Github repo:** https://github.com/mlabouardy/komiser

## Docker Usage

Run the docker based env using the public official `mlabouardy/komiser:2.4.0` docker hub repo image.
Don't forget to pass the proper authentication env variables.

```bash
docker run -d -p 3000:3000 \
-e AWS_ACCESS_KEY_ID="" \
-e AWS_SECRET_ACCESS_KEY="" \
-e AWS_DEFAULT_REGION="" \
--name komiser mlabouardy/komiser:2.4.0
```

### Test Execution Docker and Docker-Compose based

**NOTE:** We're using the `.aws/credentials` auth files via docker mounted volume together with the `--multiple` Komiser
option flag in order to get multiple AWS account access.

#### Docker based

1. docker `komiser` w/ `redis` run
```bash
╭─delivery at delivery-I7567 in ~/Binbash/repos/BB-Leverage/docker/public-docker-images/komiser on BBL-137-docker-scoutsuite-awscli-komiser✘✘✘ using ‹› 19-10-24 - 20:44:33
╰─○ make test-run-docker-komiser
docker network create -d bridge nw-komiser-redis
b8ea13e3a82a284177139f86fa9997f98b6e3a297fc8328e03d52ce977157038
docker run -d --name komiser-redis -p 6379:6379 --network nw-komiser-redis redis:5.0.6
3c6c95599a86892d395747cc36b7d4a57a0a46bc4e952f4fb86f0f02b675368d
docker run -d --name komiser -p 3000:3000 -v ~/.aws/credentials.komiser:/root/.aws/credentials --network nw-komiser-redis mlabouardy/komiser:2.4.0 --multiple --redis komiser-redis:6379 --duration 30;
db7d1c758d5ca74b64ea8cce66bbad4f104fe3e3741413b3fea59f923914a8f0

docker ps
CONTAINER ID        IMAGE                      COMMAND                  CREATED             STATUS                  PORTS                    NAMES
db7d1c758d5c        mlabouardy/komiser:2.4.0   "komiser start --mul…"   1 second ago        Up Less than a second   0.0.0.0:3000->3000/tcp   komiser
3c6c95599a86        redis:5.0.6                "docker-entrypoint.s…"   3 seconds ago       Up 1 second             0.0.0.0:6379->6379/tcp   komiser-redis

docker network ls
NETWORK ID          NAME                       DRIVER              SCOPE
ab968bc7d60c        bridge                     bridge              local
c8283f1a5e2b        host                       host                local
da3865aaa1fe        komiser_nw-komiser-redis   bridge              local
689bedb56e95        none                       null                local
b8ea13e3a82a        nw-komiser-redis           bridge              local

make test-smoke-local
make[1]: Entering directory '/home/delivery/Binbash/repos/BB-Leverage/docker/public-docker-images/komiser'

#-------------------------------------------------
#|                  APPS STATUS                  |
#-------------------------------------------------
--------------------------------------------------
 http://localhost:3000 STATUS RESPONSE CODE TEST |
--------------------------------------------------

==================================================
 => http://localhost:3000 PASSED W/ 200!!!
==================================================
make[1]: Leaving directory '/home/delivery/Binbash/repos/BB-Leverage/docker/public-docker-images/komiser'
```

2. docker `komiser` w/ `redis` stop
```bash
╭─delivery at delivery-I7567 in ~/Binbash/repos/BB-Leverage/docker/public-docker-images/komiser on BBL-137-docker-scoutsuite-awscli-komiser✘✘✘ using ‹› 19-10-24 - 20:44:40
╰─○ make test-stop-docker-komiser
docker stop komiser komiser-redis
komiser
komiser-redis
docker rm komiser komiser-redis
komiser
komiser-redis
docker network rm nw-komiser-redis
nw-komiser-redis
```

#### Docker-Compose based

1. docker-compose `komiser` w/ `redis` run
```bash
╭─delivery at delivery-I7567 in ~/Binbash/repos/BB-Leverage/docker/public-docker-images/komiser on BBL-137-docker-scoutsuite-awscli-komiser✘✘✘ using ‹› 19-10-24 - 20:46:56
╰─○ make test-run-docker-compose-komiser
docker-compose up -d
Creating redis ... done
Creating komiser ... done

docker-compose ps
 Name                Command               State           Ports
-------------------------------------------------------------------------
komiser   komiser start --multiple - ...   Up      0.0.0.0:3000->3000/tcp
redis     docker-entrypoint.sh redis ...   Up      6379/tcp

make test-smoke-local
make[1]: Entering directory '/home/delivery/Binbash/repos/BB-Leverage/docker/public-docker-images/komiser'

#-------------------------------------------------
#|                  APPS STATUS                  |
#-------------------------------------------------
--------------------------------------------------
 http://localhost:3000 STATUS RESPONSE CODE TEST |
--------------------------------------------------

==================================================
 => http://localhost:3000 PASSED W/ 200!!!
==================================================
make[1]: Leaving directory '/home/delivery/Binbash/repos/BB-Leverage/docker/public-docker-images/komiser'
```

2. docker-compose `komiser` w/ `redis` stop
```bash
╭─delivery at delivery-I7567 in ~/Binbash/repos/BB-Leverage/docker/public-docker-images/komiser on BBL-137-docker-scoutsuite-awscli-komiser✘✘✘ using ‹› 19-10-24 - 20:47:05
╰─○ make test-stop-docker-compose-komiser
docker-compose stop
Stopping komiser ... done
Stopping redis   ... done
docker-compose rm --force
Going to remove komiser, redis
Removing komiser ... done
Removing redis   ... done
```
