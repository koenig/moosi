`import Ember from 'ember'`
`import AccessActiveOrderMixin from 'moosi/mixins/access-active-order'`

TransactionController = Ember.ObjectController.extend AccessActiveOrderMixin,
  from: null
  to: null
  quantityInput: ''
  quantity: Em.computed 'quantityInput', ->
    "#{@get('quantityInput')}".replace(',', '.')
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
  execute: (action) ->
    # the idea is, that the execution of a transfer
    # is a one time event
    # so a transaction has a validity on a spcecific point in time
    # the same transaction could be a non valid transaction
    # the second time you want to execute it
    # that is why the validity appears to be something the
    # controller should check and feels wrong to place on the
    # model itself
    return unless @get('isValidTransaction')

    if action is "putBack"
      transaction = @store.createRecord 'putBack',
        from: @get 'from'
        to: @get 'to'
        quantity: @get 'quantity'
    else
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

    if @get('hasActiveOrder') and transaction.get('to.isNew')
      transaction.get('to').save().then => transaction.save()
    else
      transaction.save()
    @set 'quantityInput', null

  actions:
    resetTransaction: ->
      @setProperties
        from: null
        to: null
        quantityInput: ''


`export default TransactionController`
