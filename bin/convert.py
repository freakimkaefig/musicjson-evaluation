#!/bin/env python

"""
Usage:
    convert.py <input> <output> (--xml | --midi)

Arguments:
    <input>     Path to the **kern directory
    <output>    Path to the xml/midi output directory

Options:
    -h --help   Show this screen.
    --xml       Convert from **kern to xml
    --midi      Convert from **kern to midi
"""

import os
import sys
import subprocess

libariesPath = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'lib')
sys.path.append(libariesPath)
from docopt import docopt

if __name__ == '__main__':
    # parse arguments
    arguments = docopt(__doc__, version='1.0')
    input = arguments['<input>']
    output = arguments['<output>']
    xml = arguments['--xml']
    midi = arguments['--midi']

    if (xml):
        # binary of humdrum toolkit hum2xml
        hum2xml = os.path.join(os.path.dirname(os.path.abspath(__file__)),
                               'lib', 'hum2xml')

        # iterate files in input directory
        for root, subFolder, files in os.walk(input):
            basepath = os.path.abspath(root)
            for file in files:
                outputFile = file.rsplit('.', 1)[0] + '.xml'
                outputFilePath = os.path.join(output, outputFile)
                filePath = os.path.join(basepath, file)
                result = open(outputFilePath, 'w')
                # call humdrum toolkit binary
                subprocess.call([hum2xml, filePath], stdout=result)

    if (midi):
        # binary of humdrum toolkit hum2mid
        hum2mid = os.path.join(os.path.dirname(os.path.abspath(__file__)),
                               'lib', 'hum2mid')

        # iterate files in input directory
        for root, subFolder, files in os.walk(input):
            basepath = os.path.abspath(root)
            for file in files:
                outputFile = file.rsplit('.', 1)[0] + '.mid'
                outputFilePath = os.path.join(output, outputFile)
                filePath = os.path.join(basepath, file)
                # call humdrum toolkit binary
                subprocess.call([hum2mid, filePath, '-C', '-P', '-0', '-o',
                                 outputFilePath])
