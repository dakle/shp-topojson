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

### geoJSON > topoJSON ( with quantize )
The following command uses the -q quantize parameter to remove digits to values in an effort to reduce the file size of you topoJSON file.
```
geo2topo input_file.json -q 500 > output_file.json
```

### Simplify
The following command can be used to further simplify your topoJSON file size by removing coordinates

## Resources
[.shp > topoJSON](https://medium.com/@mbostock/command-line-cartography-part-3-1158e4c55a1e) - explaination from Mike Bostock on preparing your .shp file for d3.js mapping.
[Line simplification](https://bost.ocks.org/mike/simplify/) - explaination from Mike Bostock on line simplification.