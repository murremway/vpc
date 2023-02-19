FROM openjdk:8-jre-alpine

WORKDIR /app

COPY HelloWorld.java .
RUN javac HelloWorld.java
EXPOSE 80

CMD ["java", "HelloWorld"]
