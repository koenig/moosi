`import Ember from 'ember'`

PlantPositionController = Ember.ObjectController.extend
  needs: ['transaction']

  transaction: Em.computed.alias 'controllers.transaction'
  hasFrom: Em.computed.bool 'transaction.from'
  isFrom: Em.computed 'transaction.from', ->
    @get('transaction.from') is @get('content')
  isTo: Em.computed 'transaction.to', ->
    @get('transaction.to') is @get('content')

  actions:
    putBackToQuarter: ->
      @set 'transaction.to', @get 'content'
    executePutBack: ->
      @get('transaction').execute('putBack')


`export default PlantPositionController`
