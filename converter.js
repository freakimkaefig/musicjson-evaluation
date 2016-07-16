var fs = require('fs');
var path = require('path');
var mkdirp = require('mkdirp');
var musicjson = require('musicjson');
var musicjson2abc = require('musicjson2abc');
var writer = require('./writer');

var exports = module.exports = {};

function createMusicJson (xml, outputFile, id, cb) {
  musicjson.musicJSON(xml, function (err, data) {
    if (err) {
      throw err;
    }
    var result = musicjson2abc.xml2json(data, id);
    cb(outputFile, result);
  });
}

exports.convert = function (input, output) {
  var xmls = fs.readdirSync(path.join(__dirname, input));

  for (var i = 0; i < xmls.length; i++) {
    var xml = xmls[i];
    var filename = path.basename(xml, '.xml');
    var inputFile = path.join(__dirname, input, xml);
    var outputFile = path.normalize(path.format({
      dir: path.join(__dirname, output),
      name: filename,
      ext: '.json'
    }));

    var xmlFile = fs.readFileSync(inputFile, 'ascii');
    console.log('[' + (i+1) + '] Converting ' + inputFile + ' > ' + outputFile);
    createMusicJson(xmlFile, outputFile, filename, writer.writeFile);
  }
};
