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

    callWithState = (Func) ->
      unless @props.state
      then Func.call @, @props
      else Func.call @, @props, @props.state

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
            callWithState.call @
            , componentObj._pressButton
          waitToBinds.push k
        else
          @::[k] = v



      constructor: (props) ->
        super props

        if componentObj.constructor

          callWithState.call @
          , componentObj.constructor

        for funcName in waitToBinds
          @[funcName] = componentObj[funcName].bind @

        @

      render: ->
        callWithState.call @
        , componentObj.render
