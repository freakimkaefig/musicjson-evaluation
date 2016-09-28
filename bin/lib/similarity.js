var fs = require('fs');
var path = require('path');
var MusicJsonToolbox = require('musicjson-toolbox');
var writer = require('./writer');

var exports = module.exports = {};

exports.calculate = function (algorithm, collection, queries, output, cutoff, k1, k2, k3) {
  var adjusted = algorithm === 'gar';
  var files = fs.readdirSync(collection);
  var queryFiles = fs.readdirSync(queries);
  var similarityMatrix = [];
  var i;
  var j;
  var length = files.length;
  var queriesLength = queryFiles.length;
  var csv = '';

  if (adjusted) {
    if (typeof k1 !== 'undefined') {
      MusicJsonToolbox.globalK1 = k1;
    }
    if (typeof k2 !== 'undefined') {
      MusicJsonToolbox.globalK2 = k2;
    }
    if (typeof k3 !== 'undefined') {
      MusicJsonToolbox.globalK3 = k3;
    }
  } else {
    if (typeof k1 !== 'undefined') {
      MusicJsonToolbox.globalK = k1;
    }
  }

  // Generate similarities
  similarity = [];
  for (i = 0; i < queriesLength; i++) {
    var queryFile = queryFiles[i];
    var searchJson = JSON.parse(fs.readFileSync(path.join(queries, queryFile), 'utf-8'));
    similarity[i] = {
      search: queryFile,
      values: []
    };
    for (j = 0; j < length; j++) {
      var file = files[j];
      console.log("Processing: ", queryFile + " <> " + file);
      var json = JSON.parse(fs.readFileSync(path.join(collection, file), 'utf-8'));

      var similarityResult;
      switch (algorithm) {
        case 'ms':
          similarityResult = MusicJsonToolbox.pitchDurationSimilarity(json, searchJson, false);
          break;
        case 'gar':
          similarityResult = MusicJsonToolbox.pitchDurationSimilarity(json, searchJson, true);
          break;
        case 'interval':
          similarityResult = MusicJsonToolbox.intervalSimilarity(json, searchJson);
          break;
        case 'parson':
          similarityResult = MusicJsonToolbox.parsonSimilarity(json, searchJson);
          break;
        default:
          console.log('Unknown algorithm specified.');
          similarityResult = -Infinity;
          break;
      }

      similarity[i].values.push({
        file: file,
        value: similarityResult
      });
    }
  }

  for (i = 0; i < similarity.length; i++) {
    similarity[i].values.sort(function(a, b) {
      return b.value - a.value;
    });
    var rows = typeof cutoff !== 'undefined' ? cutoff : similarity[i].values.length;
    for (j = 0; j < rows; j++) {
      csv += similarity[i].search;
      csv += '\t';
      csv += similarity[i].values[j].file;
      csv += '\t';
      csv += similarity[i].values[j].value;
      csv += '\n';
    }
  }

  writer.writeFile(output, csv);

  console.log("Calculated '" + algorithm + "' with:");
  console.log("    - cutoff: " + cutoff);
  console.log("    - k: " + MusicJsonToolbox.globalK);
  console.log("    - k1: " + MusicJsonToolbox.globalK1);
  console.log("    - k2: " + MusicJsonToolbox.globalK2);
  console.log("    - k3: " + MusicJsonToolbox.globalK3);
  console.log("Written output to", output);
};
