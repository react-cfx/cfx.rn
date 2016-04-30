// Generated by CoffeeScript 1.10.0
var AppRegistry, Component, RN, assign, echo,
  indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; },
  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

echo = function() {
  return console.log(arguments);
};

assign = Object.assign;

AppRegistry = (RN = require('react-native')).AppRegistry;

Component = require('react').Component;

module.exports = {
  reg: AppRegistry.registerComponent,
  "new": function(component) {
    var Lifecycle, componentObj, k, newComponent, v;
    Lifecycle = ['getDefaultProps', 'getInitialState', 'componentWillMount', 'componentDidMount', 'componentWillReceiveProps', 'shouldComponentUpdate', 'componentWillUpdate', 'componentDidUpdate', 'componentWillUnmount'];
    componentObj = {};
    if (typeof component === 'function') {
      componentObj.render = component;
    } else if (typeof component === 'object') {
      for (k in component) {
        v = component[k];
        if (k === 'render' || k === 'constructor') {
          componentObj[k] = v;
          continue;
        }
        if (indexOf.call(Lifecycle, k) >= 0) {
          if (!componentObj.lifecycle) {
            componentObj.lifecycle = {};
          }
          componentObj.lifecycle[k] = v;
          continue;
        }
        if (typeof v !== 'function') {
          if (!componentObj.beforeConstructor) {
            componentObj.beforeConstructor = {};
          }
          componentObj.beforeConstructor[k] = v;
          continue;
        } else {
          if (k[0] === '_') {
            if (!componentObj.beforeConstructor) {
              componentObj.beforeConstructor = {};
            }
            componentObj.beforeConstructor[k] = v;
            continue;
          } else {
            if (!componentObj.afterConstructor) {
              componentObj.afterConstructor = {};
            }
            componentObj.afterConstructor[k] = v;
            continue;
          }
        }
      }
    } else {
      return;
    }
    if (!componentObj.render) {
      return;
    }
    return newComponent = (function(superClass) {
      var bindProps, callWithState;

      extend(newComponent, superClass);

      callWithState = function(Func) {
        if (!this.props.state) {
          return Func.call(this, this.props);
        } else {
          return Func.call(this, this.props, this.props.state);
        }
      };

      bindProps = function(props) {
        var results;
        results = [];
        for (k in props) {
          v = props[k];
          results.push(this[k] = typeof v === 'function' ? v.bind(this) : v);
        }
        return results;
      };

      function newComponent(props) {
        newComponent.__super__.constructor.call(this, props);
        if (componentObj.beforeConstructor) {
          bindProps.call(this, componentObj.beforeConstructor);
        }
        if (componentObj.constructor) {
          callWithState.call(this, componentObj.constructor);
        }
        if (componentObj.lifecycle) {
          bindProps.call(this, componentObj.lifecycle);
        }
        if (componentObj.afterConstructor) {
          bindProps.call(this, componentObj.afterConstructor);
        }
        this;
      }

      newComponent.prototype.render = function() {
        return callWithState.call(this, componentObj.render);
      };

      return newComponent;

    })(Component);
  }
};
