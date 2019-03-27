#!/bin/sh
OSM_FILE=$1

# java -Ddw.server.applicationConnectors[0].bindHost=0.0.0.0 -Dgraphhopper.datareader.file=berlin-latest.osm.pbf -jar *.jar server config-example.yml
java $JAVA_OPTS  -Ddw.server.applicationConnectors[0].bindHost=0.0.0.0 -Dgraphhopper.datareader.file="$OSM_FILE" -jar *.jar server config-example.yml

