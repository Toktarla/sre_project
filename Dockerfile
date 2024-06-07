FROM jelastic/maven:3.9.5-openjdk-21 AS build

WORKDIR /app
COPY . /app

RUN mvn clean install

EXPOSE 8080

CMD ["java", "-jar", "site/target/boot-community-demo-site-1.0.0-SNAPSHOT.jar"]