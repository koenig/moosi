`import Ember from 'ember'`
`import AccessActiveOrderMixin from 'moosi/mixins/access-active-order'`

TransactionController = Ember.ObjectController.extend AccessActiveOrderMixin,
  from: null
  to: null
  quantityInput: null
  quantity: Em.computed 'quantityInput', ->
    (@get('quantityInput') or '').replace(',', '.')
  isRealTransaction: Em.computed 'from', 'to', ->
    @get('to') isnt @get('from')
  quantityShouldBeNumeric: Em.computed 'quantity', ->
    quantity = @get 'quantity'
    !isNaN(parseFloat(quantity)) && isFinite(quantity)
  quantityShouldBeBiggerThanZero: Em.computed.gt 'quantity', 0
  quantityShouldBeSmallerThanFrom: Em.computed 'from.quantity', 'quantity', 'isRealTransaction', ->
    return yes unless @get 'isRealTransaction'
    @get('quantity') <= @get('from.quantity')
  isValidTransaction: Em.computed.and 'quantityShouldBeNumeric', 'quantityShouldBeBiggerThanZero', 'quantityShouldBeSmallerThanFrom'
  isInvalidTransaction: Em.computed.not 'isValidTransaction'
  execute: ->
    # the idea is, that the execution of a transfer
    # is a one time event
    # so a transaction has a validity on a spcecific point in time
    # the same transaction could be a non valid transaction
    # the second time you want to execute it
    # that is why the validity appears to be something the
    # controller should check and feels wrong to place on the
    # model itself
    return unless @get('isValidTransaction')

    if @get 'hasActiveOrder'
      # setup to
      transaction = @store.createRecord 'orderSelection',
        from: @get 'from'
        to: @get('activeOrder').findOrderItemFor @get('from.plant')
        quantity: @get 'quantity'

    else
      transaction = @store.createRecord 'transaction',
        from: @get 'from'
        to: @get 'to'
        quantity: @get 'quantity'

    transaction.one 'didCreate', (transaction) ->
      if transaction.get('isRealTransaction')
        transaction.decrementProperty 'from.quantity', transaction.get('quantity')
      transaction.incrementProperty 'to.quantity', transaction.get('quantity')

    @send 'resetTransaction'
    transaction.save()

  actions:
    resetTransaction: ->
      @setProperties
        from: null
        to: null
        quantityInput: null


`export default TransactionController`
