`import Ember from 'ember'`

ApplicationController = Ember.Controller.extend
  queryParams: ['activeOrderId']
  activeOrderId: null

  onActiveOrderChange: (->
    return if @get('activeOrderId') is @get('activeOrder.id')
    @set 'activeOrderId', @get 'activeOrder.id'
  ).observes 'activeOrder'

  onActiveOrderIdChange: ( ->
    return unless @get 'activeOrderId'
    @store.find('order',  @get 'activeOrderId').then (newOrder) =>
      return if @get('activeOrder.id') is newOrder.get('id')
      @set 'activeOrder', newOrder
  ).observes 'activeOrderId'


`export default ApplicationController`
