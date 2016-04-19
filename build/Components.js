// Generated by CoffeeScript 1.10.0
var Components, RN, cfxify, component, i, len, ref;

RN = require('react-native');

cfxify = require('./cfxify').cfxify;

Components = {};

ref = ['Text', 'View', 'Image', 'Navigator', 'ListView', 'TouchableHighlight', 'TouchableOpacity', 'Alert'];
for (i = 0, len = ref.length; i < len; i++) {
  component = ref[i];
  Components[component] = cfxify(RN[component]);
}

module.exports = Components;