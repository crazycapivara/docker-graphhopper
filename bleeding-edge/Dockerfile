FROM maven:3.6.0-jdk-8

ENV BRANCH ext_pointlist

RUN git clone --single-branch -b $BRANCH https://github.com/graphhopper/graphhopper.git

WORKDIR graphhopper

RUN ./graphhopper.sh build

ENV JAVA_OPTS "-server -Xconcurrentio -Xmx1g -Xms1g -XX:+UseG1GC -XX:MetaspaceSize=100M -Ddw.server.applicationConnectors[0].bindHost=0.0.0.0 -Ddw.server.applicationConnectors[0].port=8989"

VOLUME [ "/data" ]

EXPOSE 8989

ENTRYPOINT [ "./graphhopper.sh", "web" ]

CMD [ "/data/europe_germany_berlin.pbf" ]

