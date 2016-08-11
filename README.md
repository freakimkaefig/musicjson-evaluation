Essen Folksong Collection
============================================================

Generate xml or midi from **kern format:
```
python bin/convert2mid.py path/to/kern path/to/midi

python bin/convert2xml.py path/to/kern path/to/xml
```

Generate json from xml:
```
node bin/convert.js path/to/xml path/to/json
```

Generate similarity score
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