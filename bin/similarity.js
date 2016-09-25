#!/usr/bin/env node

var commander = require('commander');
var similarity = require('./lib/similarity');

var algortithmValue;
var collectionValue;
var queriesValue;
var outputValue;

commander
    .version(require('../package.json').version)
    .usage('<algorithm> <collection> <queries> <output> [-c <cutoff>]')
    .arguments('<algorithm> <collection> <queries> <output>')
    .option('-c --cutoff <cutoff>', 'number of documents to retrieve', parseInt)
    .action(function(algortithm, collection, queries, output) {
        algortithmValue = algortithm;
        collectionValue = collection;
        queriesValue = queries;
        outputValue = output;
    })
    .on('--help', function() {
        console.log('  Arguments:');
        console.log('');
        console.log('    <algorithm>    The algorithm used to calculate similarity:');
        console.log('                   - ms, gar, interval, parson');
        console.log('    <collection>   Path to the collection (json files)');
        console.log('    <queries>      Path to the queries (json files)');
        console.log('    <output>       Path to the output file (csv)');
        console.log('');
        console.log('  Examples:');
        console.log('');
        console.log('    node bin/similarity.js ms json/czech json/czech csv/output.csv');
        console.log('    node bin/similarity.js gar json/czech json/czech csv/output.csv');
        console.log('');
    })
    .parse(process.argv);

if (typeof algortithmValue === 'undefined') {
    console.error('no algorithm specified!');
    process.exit(1);
}
if (typeof collectionValue === 'undefined') {
    console.error('no collection path specified!');
    process.exit(1);
}

if (typeof queriesValue === 'undefined') {
    console.error('no queries path specified!');
    process.exit(1);
}

if (typeof outputValue === 'undefined') {
    console.error('no output path specified!');
    process.exit(1);
}

similarity.calculate(algortithmValue, collectionValue, queriesValue, outputValue, commander.cutoff);