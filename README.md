# D3 mapping from .shp file

This is a quick write up of how to convert a .shp file to topojson using [ogr2ogr](https://www.npmjs.com/package/ogr2ogr) and [topojson](https://www.npmjs.com/package/topojson)

## Getting Started

### Prerequisites

```
ogr2ogr
topojson
```

### Installing

Install ogr2ogr ( global )

```
npm install -g ogr2ogr
```

Install topojson ( global )

```
npm install -g topojson
```

## Using the CLI to convert your files

### .shp > geoJSON
The following command converts your .shp file to a geoJSON file.
```
ogr2ogr -f "GeoJSON" output_file.json input_file.shp
```

### filtering
Properties can be filtered from the .shp file when you create the geoJSON object by using the -select parameter for ogr2ogr and including a comma separated list.
```
ogr2ogr -f "GeoJSON" output_file.json input_file.shp -select "PROPERTY_NAME_1, PROERTY_NAME_2"
```

### geoJSON > topoJSON ( with quantize )
The following command uses the -q quantize parameter to remove digits to values in an effort to reduce the file size of you topoJSON file.
```
geo2topo input_file.json -q 500 > output_file.json
```

## Example
In the following example we will be starting with the S_FLD_HAZ_AR.shp file ( as well as the other mandatory files that make up the shapefile ). Before any modification these files add up to about 38 MB in size.

We will start by converting the shapefile to a geoJSON format with a new filename nc-geo.json
```
ogr2ogr -f "GeoJSON" ncgeo.json S_FLD_HAZ_AR.shp
```
This newly created geoJSON object is now 105 MB

From here we can see that the object contains a lot of properties. Say we only want to use the FLD_AR_ID and the FLD_ZONE properties, we can use the -select parameter for ogr2ogr to only output those two properties in our geoJSON object.
```
ogr2ogr -f "GeoJSON" ncFiltered.json S_FLD_HAZ_AR.shp -select "FLD_AR_ID,FLD_ZONE"
```

This new geoJSON object is still pretty large 104 MB

We can now use topojson to quantize it and convert it to a topoJSON format
```
geo2topo ncgeo.json -q 500 > nc-q.json
```

or for the filtered version
```
geo2topo ncFiltered.json -q 500 > nc-q-filtered.json
```

We should now have a much more manageable sized file to use in building our d3.js map. 

The nc-q.json topoJSON file is ~ 1.4 MB

The nc-q-filtered topoJSON file is 774 KB

## Resources
[.shp > topoJSON](https://medium.com/@mbostock/command-line-cartography-part-3-1158e4c55a1e) - explaination from Mike Bostock on preparing your .shp file for d3.js mapping.

[Line simplification](https://bost.ocks.org/mike/simplify/) - explaination from Mike Bostock on line simplification.