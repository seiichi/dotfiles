#!/usr/bin/env node

var rs = require('robotskirt')
  , util = require('util')
  , stream = require('stream');

// UTILITIES
function StringStream() {
  stream.Stream.call(this);
  this.writable = true;
  this.buffer = Buffer(0);
};
util.inherits(StringStream, stream.Stream);

StringStream.prototype.write = function(data) {
  if (data && data.length)
    this.buffer = Buffer.concat([this.buffer, data]);
};

StringStream.prototype.end = function(data) {
  this.write(data);
  this.emit('end');
};

// THE ACTUAL CODE

//Read all data
var input = new StringStream();
process.stdin.pipe(input);
input.on('end', function () {
  //Make the renderer and parser
  //var parser = rs.Markdown.std([rs.EXT_NO_INTRA_EMPHASIS]);
  var parser = rs.Markdown.std();

  //Parse the data
  var output = parser.render(input.buffer.toString());
  process.stdout.write(output);
});
