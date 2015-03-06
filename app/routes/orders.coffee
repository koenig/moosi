`import Ember from 'ember'`

OrdersRoute = Ember.Route.extend
  model: -> @store.find 'order'
  actions:
    linkTo: (id) -> @transitionTo 'order', id

`export default OrdersRoute`
