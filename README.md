Essen Folksong Collection
============================================================
This toolbox is used to evaluate the custom implementation of the
Mongeau-Sankoff-Measure for melodic similarity implemented in the
[musicjson-toolbox](https://github.com/freakimkaefig/musicjson-toolbox). It
contains functions to convert songs of the essen folksong collection in **kern
format to midi or xml, and from xml to json.

The two implemented algorithms calculate similarity scores between songsheets.
The [MelodyShape](https://github.com/julian-urbano/MelodyShape)-Implementation
is used from Julian Urbano.

Convert songsheet
------------------------------------------------------------

Generate xml or midi from **kern format:
```
python bin/convert2mid.py path/to/kern path/to/midi

python bin/convert2xml.py path/to/kern path/to/xml
```

Generate json from xml:
```
node bin/convert.js path/to/xml path/to/json
```

Calculate similarity score
------------------------------------------------------------
MelodyShape
```
python bin/similarity.py [algorithm] [path/to/collection]

# Example: 2015-ShapeH with demo collection
python bin/similarity.py 2015-shapeh test/collection/midi/
```

Mongeau-Sankoff
```
node bin/similarity.js path/to/collection path/to/output.csv
```