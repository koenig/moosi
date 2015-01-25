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
    return 'item rows second' if @get('isFrom') and @get('hasTo')
    return 'item rows prime' if @get('isFrom')
    'item rows'

  onQuantityChange: (->
    return if @get('quantity') > 0
    @get('content.order.orderItems').removeObject @get('content')
  ).observes 'quantity'

  actions:
    showPutBack: ->
      if @get 'hasFrom'
        @get('transaction').send('resetTransaction')
      else
        @set 'transaction.from', @get 'content'
        @set 'transaction.quantity', @get 'quantity'
      false

`export default OrderItemController`
