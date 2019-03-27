FROM maven:3.6.0-jdk-8 AS builder

ENV BRANCH ext_pointlist

RUN git clone --single-branch -b $BRANCH https://github.com/graphhopper/graphhopper.git

WORKDIR graphhopper

RUN ./graphhopper.sh build

# ---

FROM openjdk:8-jre

RUN wget https://raw.githubusercontent.com/graphhopper/graphhopper/master/config-example.yml \
   && wget http://download.geofabrik.de/europe/germany/berlin-latest.osm.pbf

COPY --from=builder  /graphhopper/web/target/graphhopper-web-0.13-SNAPSHOT.jar /

#ENV JAVA_OPTS "-server -Xconcurrentio -Xmx1g -Xms1g -XX:+UseG1GC -XX:MetaspaceSize=100M -Ddw.server.applicationConnectors[0].bindHost=0.0.0.0 -Ddw.server.applicationConnectors[0].port=8989"
ENV JAVA_OPTS "-Xmx1g -Xms1g"

#VOLUME [ "/data" ]

EXPOSE 8989

# CMD java -Ddw.server.applicationConnectors[0].bindHost=0.0.0.0 -Dgraphhopper.datareader.file=berlin-latest.osm.pbf -jar *.jar server config-example.yml

COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]

CMD [ "/data/europe_germany_berlin.pbf" ]
#ENTRYPOINT [ "./graphhopper.sh", "web" ]

#CMD [ "/data/europe_germany_berlin.pbf" ]

