{ cfxify } = require './cfxify'
reactRedux = require 'cfx.react-redux'

exports.Provider = cfxify ReactRedux.Provider
exports.connect = -> cfxify connect arguments
