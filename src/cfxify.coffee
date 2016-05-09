{
  StyleSheet
} = RN = require 'react-native'
{ createFactory } = require 'react'

Component = require './Component'

Styl = StyleSheet.create

cfxify = createFactory

cfx = (component) ->
  cfxify Component.new component

module.exports = {
  Styl
  cfxify
  cfx
}
