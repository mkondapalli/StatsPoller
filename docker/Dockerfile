# This is alternate Dockerfile to vuild the Statspoller docker image
# The file is being looked by the maven plugin in pom.xml
# The image gets built using command - mvn clean package docker:build
# The image gets pushed using command - mvn docker:push
# Check out for the <serverId>quay-hub</serverId>, this needs to be set in .m2/settings.xml for sucessfully able to push quay.io repo
# Replace the  <dockerRepo> to different repo if the image needs to be pushed to other repo

FROM openjdk:8-jre

#USER root

WORKDIR /statsp

COPY . /statsp

RUN addgroup statsp && adduser -D -G statsp statsp

RUN mkdir /statsp/output /statsp/logs 

#COPY target/StatsPoller.jar /statsp
#COPY target/lib /statsp/lib
#COPY conf /statsp/conf

RUN chown -R statsp:statsp /statsp

USER statsp

HEALTHCHECK --interval=5m --timeout=3s \
  CMD ps -ef | grep StatsPoller.jar || exit 1

ENTRYPOINT ["java","-jar", "StatsPoller.jar"]


