#!/usr/bin/env node

var commander = require('commander');
var converter = require('./lib/converter');

var inputValue;
var outputValue;

commander
    .version(require('../package.json').version)
    .usage('<input> <output>')
    .arguments('<input> <output>')
    .action(function(input, output) {
        inputValue = input;
        outputValue = output;
    })
    .on('--help', function() {
        console.log('  Examples:');
        console.log('');
        console.log('    $ node bin/convert.js xml/essen/europa/czech json/essen/europa/czech');
        console.log('');
    })
    .parse(process.argv);

if (typeof inputValue === 'undefined') {
  console.error('no input path specified!');
  process.exit(1);
}
if (typeof outputValue === 'undefined') {
  console.error('no output path specified!');
  process.exit(1);
}

converter.convert(inputValue, outputValue);