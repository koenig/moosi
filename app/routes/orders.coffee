`import Ember from 'ember'`

OrdersRoute = Ember.Route.extend
  model: -> @store.find 'order'
  actions:
    linkToOrder: (order) -> @transitionTo 'order', order

`export default OrdersRoute`
