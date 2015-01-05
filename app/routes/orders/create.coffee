`import Ember from 'ember'`

OrdersCreateRoute = Ember.Route.extend
  model: ->
    @store.createRecord 'order'

  actions:
    goBack: ->
      @modelFor('orders.create').destroyRecord()
      @transitionTo 'orders'



`export default OrdersCreateRoute`
