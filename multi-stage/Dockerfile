FROM maven:3.6.0-jdk-8 AS builder

ENV BRANCH ext_pointlist

RUN git clone --single-branch -b $BRANCH https://github.com/graphhopper/graphhopper.git

WORKDIR graphhopper

RUN ./graphhopper.sh build

# ---

FROM openjdk:8-jre

ENV JAVA_OPTS "-Xmx1g -Xms1g"

RUN wget -P /data http://download.geofabrik.de/europe/germany/berlin-latest.osm.pbf

RUN mkdir /graphhopper

WORKDIR /graphhopper

COPY --from=builder /graphhopper/web/target/graphhopper-web-*-SNAPSHOT.jar .

COPY --from=builder /graphhopper/config-example.yml .

VOLUME [ "/data" ]

EXPOSE 8989

COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]

CMD [ "/data/berlin-latest.osm.pbf" ]

