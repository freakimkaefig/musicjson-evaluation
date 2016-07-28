var commander = require('commander');
var converter = require('../converter');
var similarity = require('../similarity');

var cmdValue;
var inputValue;
var outputValue;

commander
  .version(require('../package.json').version)
  .usage('node bin.js <cmd> [input] [output] [search]')
  .arguments('<cmd> [input] [output] [search]')
  .action(function (cmd, input, output, search) {
    cmdValue = cmd;
    inputValue = input;
    outputValue = output;
    searchValue = search;
  })
  .on('--help', function() {
    console.log('  Commands:');
    console.log('');
    console.log('    convert     used for converting musicxml to json');
    console.log('                Usage: $ node bin.js convert path/to/xmls path/to/output');
    console.log('');
    console.log('    similarity  used to calculate similarity');
    console.log('                Usage: $ node bin.js similarity path/to/json path/to/output path/to/search');
    console.log('');
    console.log('  Examples:');
    console.log('');
    console.log('    $ node bin/bin.js convert xml/essen/europa/czech json/essen/europa/czech');
    console.log('    $ node bin/bin.js similarity json/essen/europa/czech csv/essen/europa/czech');
    console.log('    $ node bin/bin.js similarity json/essen/europa/czech csv/essen/europa/czech search/czech');
    console.log('');
  })
  .parse(process.argv);


if (typeof cmdValue === 'undefined') {
  console.error('no command given!');
  process.exit(1);
}
if (typeof inputValue === 'undefined') {
  console.error('no input path specified!');
  process.exit(1);
}
if (typeof outputValue === 'undefined') {
  console.error('no output path specified!');
  process.exit(1);
}

if (typeof searchValue === 'undefined') {
  searchValue = inputValue;
}

// console.log(cmdValue);
// console.log(inputValue);
// console.log(outputValue);

switch (cmdValue) {
  case 'convert':
    converter.convert(inputValue, outputValue);
    break;

  case 'similarity':
    similarity.calculate(inputValue, outputValue, searchValue);
    break;

  default:
    console.log('commend not found.');
    process.exit(1);
}
