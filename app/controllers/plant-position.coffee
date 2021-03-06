`import Ember from 'ember'`

PlantPositionController = Ember.ObjectController.extend
  needs: ['transaction']

  transaction: Em.computed.alias 'controllers.transaction'
  hasFrom: Em.computed.bool 'transaction.from'
  hasTo: Em.computed.bool 'transaction.to'
  isFrom: Em.computed 'transaction.from', ->
    @get('transaction.from') is @get('content')
  isTo: Em.computed 'transaction.to', ->
    @get('transaction.to') is @get('content')

  activityStyles: Em.computed 'isTo', 'isFrom', ->
    return 'prime' if @get 'isTo'
    ''


  actions:
    putBackToQuarter: ->
      @get('transaction').setProperties
        to: @get 'content'
    executePutBack: ->
      @get('transaction').execute('putBack')


`export default PlantPositionController`
