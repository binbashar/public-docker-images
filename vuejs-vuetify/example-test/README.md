<div align="center">
    <img src="https://raw.githubusercontent.com/binbashar/public-docker-images/master/figures/binbash.png" 
    alt="binbash" width="250"/>
</div>
<div align="right">
  <img src="https://raw.githubusercontent.com/binbashar/public-docker-images/master/figures/binbash-leverage-docker.png" 
  alt="leverage" width="130"/>
</div>
# Binbash.com.ar Frontend

## References
* Vuetify: https://vuetifyjs.com/en/introduction/guide/
* Docker-compose: https://docs.docker.com/compose/reference/overview/
* Docker: https://docs.docker.com/engine/reference/run/

## Project Structure
```
.
├── docker-compose.yaml       -> Used for local environments dev
├── docker-compose.yaml       -> Used for local environments prd 
├── Dockerfile                -> Uses a multi-stage approach to define dev and prd builds
├── README.md
└── src
    ├── assets/
    ├── components/
    ├── plugins/
    ├── App.vue
    └── main.js
```

## Run the local environment with docker-compose
* Spin up the local environment with verbose output:
```
docker-compose up
```
After the application starts, navigate to `http://localhost:8080` in your web browser.

* Spin up the local environment in background mode:
```
docker-compose up -d
```
This won't show any output so you will have to wait until the local server is up. Only then you will be able to navigate to `http://localhost:8080` in your web browser.

* Check running containers with docker-compose:
```
docker-compose ps
```

* Stop and remove the containers:
```
docker-compose down
```


## Run local environment without docker/docker-compose
* Make sure you have the following dependencies installed in your system:
  * node    >= v13.12.0
  * npm     >= v6.14.4
  * yarn    >= v1.22.4
  * vue-cli >= v4.2.3

* Install dependencies:
```
yarn install
```

* Run the server in development mode:
```
yarn run serve
```

## Create a production build via docker
```
docker build -t binbashcomar:release --target prd .
```

