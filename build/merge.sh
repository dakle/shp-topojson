#!/bin/bash

for f in *.shp; do ogr2ogr -update -append merged.shp $f -f "ESRI Shapefile"; done;