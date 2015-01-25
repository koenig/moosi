`import Ember from 'ember'`

OrderItemController = Ember.ObjectController.extend
  needs: ['transaction']

  transaction: Em.computed.alias 'controllers.transaction'
  hasFrom: Em.computed.bool 'transaction.from'
  hasTo: Em.computed.bool 'transaction.to'
  isFrom: Em.computed 'transaction.from', ->
    @get('transaction.from') is @get('content')
  isTo: Em.computed 'transaction.to', ->
    @get('transaction.to') is @get('content')

  activityStyles: Em.computed 'isTo', 'isFrom', ->
    return 'second' if @get('isFrom') and @get('hasTo')
    return 'prime' if @get('isFrom')
    ''


  actions:
    showPutBack: ->
      if @get 'hasFrom'
        @get('transaction').send('resetTransaction')
      else
        @set 'transaction.from', @get 'content'
      false

`export default OrderItemController`
