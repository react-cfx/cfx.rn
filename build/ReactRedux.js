// Generated by CoffeeScript 1.10.0
var ReactRedux, cfxify;

cfxify = require('./cfxify').cfxify;

ReactRedux = require('cfx.react-redux');

exports.Provider = cfxify(ReactRedux.Provider);

exports.connect = function() {
  return cfxify(ReactRedux.connect.apply(this, arguments));
};
