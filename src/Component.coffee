{ assign } = Object
{
  AppRegistry
} = RN = require 'react-native'
{ Component } = require 'react'

module.exports =

  reg: AppRegistry.registerComponent

  new: (component) ->

    componentObj = {}

    if typeof component is 'function'

      componentObj.render = component

    else if typeof component is 'object'

      return unless component.render
      componentObj = assign {}, componentObj, component

    # TODO use throw error with error message
    else return

    class newComponent extends Component

      waitToBinds = []

      for k, v of componentObj
        continue if (
          k is 'render' or
          k is 'constructor'
        )

        # echo "#{k}: #{typeof v}"

        if typeof v is 'function'
          @::[k] = ->
            componentObj._pressButton
            .call @, @props, @state
          waitToBinds.push k
        else
          @::[k] = v

      constructor: (props) ->
        super props
        if componentObj.constructor
          componentObj.constructor
          .call @, @props, @state
        for funcName in waitToBinds
          @[funcName] = componentObj[funcName].bind @
        @

      render: ->
        componentObj.render.call @, @props, @state
