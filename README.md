musicjson-evaluation
============================================================
This toolbox is used to evaluate the custom implementation of the
Mongeau-Sankoff-Measure for melodic similarity implemented in the
[musicjson-toolbox](https://github.com/freakimkaefig/musicjson-toolbox). It
contains functions to convert songs of the essen folksong collection in **kern
format to midi or xml, and from xml to json.

The scores aren't included, but are available from 
[KernScores](http://kern.humdrum.org/cgi-bin/browse?l=/essen/europa).


The two implemented algorithms calculate similarity scores between songsheets 
based on Mongeau-Sankoff-Measure.
The [MelodyShape](https://github.com/julian-urbano/MelodyShape)-Implementation
of 2015-ShapeH is used from Julian Urbano [[1]](#sources).


Commands
------------------------------------------------------------
### Convert songsheet

Generate xml or midi from **kern format:
```
python bin/convert2mid.py kern/czech midi/czech

python bin/convert2xml.py kern/czech xml/czech
```

Generate json from xml:
```
node bin/convert.js path/to/xml path/to/json
```

### Calculate similarity score
MelodyShape:
```
# Usage:
python bin/similarity.py <algorithm> <collection> <queries> <output>

# Example: 2015-ShapeH with demo collection
python bin/similarity.py 2015-shapeh collection/midi/ query/midi result/data/2015-shapeh.csv
```

Mongeau-Sankoff:
```
# Usage:
node bin/similarity.js <algorithm> <collection> <queries> <output>

# Example
node bin/similarity.js ms collection/json/ query/json result/data/ms.csv
node bin/similarity.js gar collection/json/ query/json result/data/gar.csv
```
`ms` is using original Mongeau-Sankoff-Measure [[2]](#sources), where `gar` 
is using the adjusted version by [[3]](#sources).

Use cutoff (only retrieve N-top documents for a query:
```
# Usage:
python bin/similarity.py <algorithm> <collection> <queries> <output> -c <cutoff>
node bin/similarity.js <algorithm> <collection> <queries> <output> -c <cutoff>

# Example
python bin/similarity.py 2015-shapeh collection/midi/ query/midi result/data/2015-shapeh.csv -c 10
node bin/similarity.js ms collection/json/ query/json result/data/ms.csv -c 10
node bin/similarity.js gar collection/json/ query/json result/data/gar.csv -c 10
```

Sources
------------------------------------------------------------
[1] Urbano, J. (2015). MelodyShape at MIREX 2015 Symbolic Melodic Similarity.
In 11th Music Information Retrieval Evaluation eXchange (MIREX 2015). Retrieved 
from http://www.music-ir.org/mirex/abstracts/2015/JU1.pdf

[2] Mongeau, M., & Sankoff, D. (1990). Comparison of musical sequences. 
Computers and the Humanities, 24(3), 161–175. Retrieved from 
http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.666.2716&rep=rep1&type=pdf

[3] Gómez, C., Abad-Mota, S., & Ruckhaus, E. (2007). An Analysis of the 
Mongeau-Sankoff Algorithm for Music Information Retrieval. Proceedings of the 
8th International Conference on Music Information Retrieval (ISMIR), 109–110. 
Retrieved from 
http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.133.5044&rep=rep1&type=pdf

