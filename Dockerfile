FROM openjdk:8-jre

LABEL maintainer="Stefan Kuethe <crazycapivara@gmail.com>"

RUN wget https://graphhopper.com/public/releases/graphhopper-web-0.11.0.jar \
  && wget https://raw.githubusercontent.com/graphhopper/graphhopper/master/config-example.yml

RUN wget http://download.geofabrik.de/europe/germany/berlin-latest.osm.pbf

EXPOSE 8989

CMD java -Ddw.server.applicationConnectors[0].bindHost=0.0.0.0 -Dgraphhopper.datareader.file=berlin-latest.osm.pbf -jar *.jar server config-example.yml

