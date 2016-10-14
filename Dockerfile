FROM openjdk:8-jre-alpine

USER root

WORKDIR /statsp

RUN addgroup statsp && adduser -D -G statsp statsp

RUN mkdir /statsp/output /statsp/logs /statsp/lib

COPY target/StatsPoller.jar /statsp
COPY target/lib /statsp/lib
COPY conf /statsp/conf

RUN chown -R statsp:statsp /statsp

USER statsp

HEALTHCHECK --interval=5m --timeout=3s \
  CMD ps -ef | grep StatsPoller.jar || exit 1

ENTRYPOINT ["java","-jar", "StatsPoller.jar"]
