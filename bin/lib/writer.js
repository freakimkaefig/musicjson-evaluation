var fs = require('fs');
var path = require('path');
var mkdirp = require('mkdirp');

var exports = module.exports = {};

exports.writeFile = function (outputFile, contents) {
  mkdirp(path.dirname(outputFile), function(err) {
    if (err) {
      throw err;
    }
    fs.writeFileSync(outputFile, contents);
  });
};
