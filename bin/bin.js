var commander = require('commander');
var converter = require('../converter');
var similarity = require('../similarity');

var cmdValue;
var inputValue;
var outputValue;

commander
  .version(require('../package.json').version)
  .arguments('<cmd> [input] [output]')
  .action(function (cmd, input, output) {
    cmdValue = cmd;
    inputValue = input;
    outputValue = output;
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

// console.log(cmdValue);
// console.log(inputValue);
// console.log(outputValue);

switch (cmdValue) {
  case 'convert':
    converter.convert(inputValue, outputValue);
    break;

  case 'similarity':
    similarity.calculate(inputValue, outputValue);
    break;

  default:
    console.log('commend not found.');
    process.exit(1);
}
