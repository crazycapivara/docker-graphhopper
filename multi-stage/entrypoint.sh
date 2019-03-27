#!/bin/sh
OSM_FILE=$1

java $JAVA_OPTS  -Ddw.server.applicationConnectors[0].bindHost=0.0.0.0 -Dgraphhopper.datareader.file="$OSM_FILE" -jar *.jar server config-example.yml

