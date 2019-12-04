FROM openjdk:12

ARG USERNAME
ARG PASSWORD

ENV USERNAME=$USERNAME
ENV PASSWORD=$PASSWORD

VOLUME /tmp

EXPOSE 8890

ADD ./target/st-config-server-0.0.1-SNAPSHOT.jar st-config-server.jar

ENTRYPOINT java -jar /st-config-server.jar --spring.cloud.config.server.git.username=$USERNAME --spring.cloud.config.server.git.password=$PASSWORD