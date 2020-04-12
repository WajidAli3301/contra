FROM openjdk:8-alpine

# Required for starting application up.
RUN apk update && apk add /bin/sh

RUN mkdir -p /opt/app
ENV PROJECT_HOME /opt/app

COPY target/mmocontra-0.0.1-SNAPSHOT.jar $PROJECT_HOME/mmocontra-0.0.1-SNAPSHOT.jar

WORKDIR $PROJECT_HOME

CMD ["java", "-Dspring.data.mongodb.uri=mongodb://mongo:27017/contra","-Djava.security.egd=file:/dev/./urandom","-jar","./mmocontra-0.0.1-SNAPSHOT.jar"]
