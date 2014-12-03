`import Ember from 'ember'`

PositionController = Ember.ObjectController.extend
  needs: ['transaction']
  transaction: Em.computed.alias 'controllers.transaction'
  hasFrom: Em.computed.bool 'transaction.from'
  isFrom: Em.computed 'transaction.from', ->
    @get('transaction.from') is @get('content')
  isTo: Em.computed 'transaction.to', ->
    @get('transaction.to') is @get('content')


  actions:
    selectPosition: ->
      @set 'transaction.to', @get 'content'
      unless @get 'hasFrom'
        @set 'transaction.from', @get 'content'

`export default PositionController`
