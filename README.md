# Config Server

Server that manages the configuration of all microservices.

## Configuration

In the file st-config-server/src/main/resources/**application.yml** you can configure the username and password of the data repository

```yml
spring:
  profiles: develop
  cloud:
    config:
      server:
        git:
          uri: http://192.168.98.230/sistema-transicion/configuration/st-configuration-properties.git
          username: USERNAME
          password: PASSWORD
          default-label: develop
```

## Running Development

Alternatively, credentials can be sent via command line.

```sh
$ mvn spring-boot:run -Drun.arguments=--spring.cloud.config.server.git.username=USERNAME,--spring.cloud.config.server.git.password=PASSWORD
```

## Running Production

### Master Branch

Go to the master branch

```sh
$ git checkout master
```

### Generate jar

```sh
$ mvn clean package
```

### Create Network Docker

```sh
$ docker network create st
```

### Create image from Dockerfile

The username and password are sent for your corresponding configuration.

```sh
$ docker build -t st-config-server:ursus --build-arg USERNAME=USERNAME --build-arg PASSWORD=PASSWORD --no-cache .
```

### Run Container

```sh
$ docker run -p 8890:8890 --name st-config-server --network st st-config-server:ursus
```

## License

[Agencia de Implementación - BSF Swissphoto - INCIGE](https://github.com/AgenciaImplementacion/st-config-server/blob/master/LICENSE)