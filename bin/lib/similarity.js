var fs = require('fs');
var path = require('path');
var MusicJsonToolbox = require('musicjson-toolbox');
var writer = require('./writer');

var exports = module.exports = {};

exports.calculate = function (input, output) {
  var files = fs.readdirSync(input);
  var similarityMatrix = [];
  var i;
  var j;
  var length = files.length;
  var csv = '';

  // Generate similarities
  similarity = [];
  for (i = 0; i < length; i++) {
    var searchFile = files[i];
    var searchJson = JSON.parse(fs.readFileSync(path.join(input, searchFile), 'utf-8'));
    similarity[i] = {
      search: searchFile,
      values: []
    };
    for (j = 0; j < length; j++) {
      var file = files[j];
      console.log("Processing: ", searchFile + " <> " + file);
      var json = JSON.parse(fs.readFileSync(path.join(input, file), 'utf-8'));
      similarity[i].values.push({
        file: file,
        value: MusicJsonToolbox.pitchDurationSimilarity(json, searchJson)
      });
    }
  }


  for (i = 0; i < similarity.length; i++) {
    similarity[i].values.sort(function(a, b) {
      return b.value - a.value;
    });
    for (j = 0; j < similarity[i].values.length; j++) {
      csv += similarity[i].search;
      csv += '\t';
      csv += similarity[i].values[j].file;
      csv += '\t';
      csv += similarity[i].values[j].value;
      csv += '\n';
    }
  }

  writer.writeFile(output, csv);
};
