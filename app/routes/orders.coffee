`import Ember from 'ember'`

OrdersRoute = Ember.Route.extend
  model: -> @store.find 'order'
  actions:
    linkToOrder: (order)-> @transitionTo 'order', order
    selectActiveOrder: (order) ->
      console.log 'selecting order', order
      @controllerFor('application').set 'activeOrder', order
      @send 'goToPlants'


`export default OrdersRoute`
