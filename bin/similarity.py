#!/bin/env python

"""
Usage:
    similarity.py <algorithm> <input> <output>

Arguments:
    <algorithm>     The algorithm used to calculate similarity:
                    - 2010-domain, 2010-pitchderiv, 2010-shape
                    - 2011-shape, 2011-pitch, 2011-time
                    - 2012-shapeh, 2012-shapel, 2012-shapeg, 2012-time, 2012-shapetime
                    - 2013-shapeh, 2013-time, 2013-shapetime
                    - 2014-shapeh, 2014-time, 2014-shapetime
                    - 2015-shapeh, 2015-time, 2015-shapetime
    <input>         Path to the midi file directory (used foas collection and queries)
    <output>        Path to the output csv file

Options:
    -h --help       Show this screen.
"""

import os
import sys
import subprocess

libariesPath = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'lib')
sys.path.append(libariesPath)
from docopt  import docopt

if __name__ == '__main__':
    arguments = docopt(__doc__, version='1.0')

    algorithm = arguments['<algorithm>']
    input = arguments['<input>']
    output = arguments['<output>']

    jar = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'lib', 'melodyshape-1.3.jar')
    outputFile = open(os.path.abspath(output), "w")

    for root, subFolder, files in os.walk(input):
        print "Processing: " + root
        subprocess.call(['java', '-jar', jar, '-q', root, '-c', root, '-a', algorithm], stdout=outputFile)