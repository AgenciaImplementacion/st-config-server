FROM openjdk:12

ARG USERNAME
ARG PASSWORD
ARG HOST
ARG XMX=1024m
ARG PROFILE=production

ENV USERNAME=$USERNAME
ENV PASSWORD=$PASSWORD
ENV HOST=$HOST
ENV XMX=$XMX
ENV PROFILE=$PROFILE

VOLUME /tmp

EXPOSE 8890

ADD ./target/st-config-server-0.0.1-SNAPSHOT.jar st-config-server.jar

ENTRYPOINT java -Xmx$XMX -jar /st-config-server.jar --spring.profiles.active=$PROFILE --spring.cloud.config.server.git.username=$USERNAME --spring.cloud.config.server.git.password=$PASSWORD --spring.cloud.config.server.git.uri=$HOST 