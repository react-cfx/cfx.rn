{
  createFactory
  StyleSheet
} = RN = require 'react-native'

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
