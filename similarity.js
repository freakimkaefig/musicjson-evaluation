var fs = require('fs');
var path = require('path');
var MusicJsonToolbox = require('musicjson-toolbox');
var writer = require('./writer');

var exports = module.exports = {};

exports.calculate = function (input, output) {
  var files = fs.readdirSync(path.join(__dirname, input));
  var similarityMatrix = [];
  var i;
  var j;
  var length = files.length; // files.length
  var csv = '';

// Setup matrix
  similarityMatrix[0] = [];
  for (i = 1; i <= length; i++) {
    var file = files[i-1];
    var json = require(path.join(__dirname, input, file));
    similarityMatrix[i] = [file];
    similarityMatrix[0][i] = file;
  }

  for (i = 1; i <= length; i++) {
    for (j = 1; j <= length; j++) {
      var json1 = require(path.join(__dirname, input, files[i-1]));
      var json2 = require(path.join(__dirname, input, files[j-1]));
      console.log("Calculate similarity: " + files[i-1] + " <> " + files[j-1]);
      similarityMatrix[i][j] = MusicJsonToolbox.pitchDurationSimilarity(json1, json2);
    }
  }

  for (i = 0; i < similarityMatrix.length; i++) {
    // console.log(similarityMatrix[i].join(' | '));
    csv += similarityMatrix[i].join(', ');
    csv += '\n';
  }

  writer.writeFile(path.join(__dirname, output, 'similarity.csv'), csv);
};
