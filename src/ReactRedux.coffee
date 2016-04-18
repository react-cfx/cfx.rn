{ cfxify } = require './cfxify'
ReactRedux = require 'cfx.react-redux'

exports.Provider = cfxify ReactRedux.Provider
exports.connect = -> cfxify ReactRedux.connect arguments
