module.exports = function(path) {
  if (!path)
    return '"missing path parameter"';
  else
    return path.match(/(\w+)\.html$/)[1];
}
