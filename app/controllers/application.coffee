`import Ember from 'ember'`

ApplicationController = Ember.Controller.extend
  queryParams: ['aid']
  aid: null

  onActiveOrderChange: (->
    return if @get('aid') is @get('activeOrder.id')
    @set 'aid', @get 'activeOrder.id'
  ).observes 'activeOrder'

  onActiveOrderIdChange: ( ->
    return unless @get 'aid'
    @store.find('order',  @get 'aid').then (newOrder) =>
      return if @get('activeOrder.id') is newOrder.get('id')
      @set 'activeOrder', newOrder
  ).observes 'aid'


`export default ApplicationController`
