ReactTransitionGroup = require 'react/lib/ReactTransitionGroup'

actions  = require './actions'
template = require './template'
  .locals {ReactTransitionGroup}

defaultKeymap = require '../../fixtures/default-keymap'
LinkedStateMixin = require 'react-addons-linked-state-mixin'

module.exports = React.createClass
  mixins: [Arda.mixin, actions, LinkedStateMixin]
  componentDidUpdate: ->
    if @props.type is 'search'
      jQuery(@refs.query).focus()

  getInitialState: ->
    checkedForUpdate: false
    checkedForCoedit: false

  render: ->
    template _.extend {}, @, @props, @state, self: @, keymap: defaultKeymap
