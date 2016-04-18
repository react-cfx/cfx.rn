RN = require 'react-native'
{
  Styl
  cfxify
  cfx
} = require './cfxify'
Comp = require './Component'
Comps = require './Components'
{
  Provider
  connect
} = require './ReactRedux'

Exports = {
  RN

  Styl
  cfxify
  cfx

  Comp
  Comps

  Provider
  connect
}

for item in [
  'Platform'
  'PropTypes'
]
  Exports[item] = RN[item]

module.exports = Exports
