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
          uri: HOSTNAME
          username: USERNAME
          password: PASSWORD
          default-label: develop
```

## Running Development

Alternatively, credentials can be sent via command line.

```sh
$ mvn spring-boot:run -Dspring-boot.run.arguments=--spring.profiles.active=develop,--spring.cloud.config.server.git.username=USERNAME,--spring.cloud.config.server.git.password=PASSWORD,--spring.cloud.config.server.git.uri=HOSTNAME
```

## License

[Agencia de Implementación - BSF Swissphoto - INCIGE](https://github.com/AgenciaImplementacion/st-config-server/blob/master/LICENSE)