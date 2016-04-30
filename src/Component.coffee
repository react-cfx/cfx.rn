echo = -> console.log arguments
{ assign } = Object
{
  AppRegistry
} = RN = require 'react-native'
{ Component } = require 'react'

module.exports =

  reg: AppRegistry.registerComponent

  new: (component) ->

    Lifecycle = [
      # http://www.tuicool.com/articles/nu6zInB
      # start
      'getDefaultProps'

      # mount
      'getInitialState'
      'componentWillMount'
      # 'render'
      'componentDidMount'

      # props changed # 'propTypes'
      'componentWillReceiveProps'

      # state changed
      'shouldComponentUpdate'
      'componentWillUpdate'
      # 'render'
      'componentDidUpdate'

      #  unmount
      'componentWillUnmount'
    ]

    componentObj = {}
    # beforeConstructor
    # constructor
    # afterConstructor
    # lifecycle
    # render

    if typeof component is 'function'

      componentObj.render = component

    else if typeof component is 'object'

      for k, v of component
        # constructor && render
        if k in [
          'render'
          'constructor'
        ]
          componentObj[k] = v
          continue

        # Lifecycle
        if k in Lifecycle
          unless componentObj.lifecycle
            componentObj.lifecycle = {}
          componentObj.lifecycle[k] = v
          continue

        unless typeof v is 'function'

          unless componentObj.beforeConstructor
            componentObj.beforeConstructor = {}
          componentObj.beforeConstructor[k] = v
          continue

        else
          if k[0] is '_'

            unless componentObj.beforeConstructor
              componentObj.beforeConstructor = {}
            componentObj.beforeConstructor[k] = v
            continue

          else

            unless componentObj.afterConstructor
              componentObj.afterConstructor = {}
            componentObj.afterConstructor[k] = v
            continue

    # TODO throw error
    else return

    # echo componentObj
    # TODO throw error
    return unless componentObj.render

    class newComponent extends Component

      # callWithState = (Func, args) ->
      callWithState = (Func) ->
        unless @props.state
        then Func.call @, @props
        else Func.call @, @props, @props.state

        # args = [] unless args or (typeof args is 'object')
        # if args.length is 0
        #   unless @props.state
        #   then Func.call @, @props
        #   else Func.call @, @props, @props.state
        # else
        #   unless @props.state
        #   then args.push @props
        #   else args.concat [
        #     @props
        #     @props.state
        #   ]
        #   Func.call @, args

      bindProps = (props) ->
        for k, v of props
          @[k] =
            if typeof v is 'function'
            then v.bind @
            else v

      constructor: (props) ->
        super props

        if componentObj.beforeConstructor
          bindProps.call @
          , componentObj.beforeConstructor

        if componentObj.constructor
          callWithState.call @
          , componentObj.constructor

        if componentObj.lifecycle
          bindProps.call @
          , componentObj.lifecycle

        if componentObj.afterConstructor
          bindProps.call @
          , componentObj.afterConstructor

        @

      render: ->
        callWithState.call @
        , componentObj.render
