#!/usr/bin/env node

var commander = require('commander');
var similarity = require('./lib/similarity');

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
        console.log('    $ node bin/similarity.js json/essen/europa/czech csv/output.csv');
        console.log('    $ node bin/similarity.js json/essen/europa/czech csv/output.csv search/czech');
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

similarity.calculate(inputValue, outputValue);