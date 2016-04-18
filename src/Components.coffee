RN = require 'react-native'
{ cfxify } = require './cfxify'

Components = {}

for component in [
  'Text'
  'View'
  'Image'
  'Navigator'
  'ListView'

  'TouchableHighlight'
  'TouchableOpacity'

  'Alert'
]
  Components[component] = cfxify RN[component]

module.exports = {
  Components
}
