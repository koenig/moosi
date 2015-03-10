`import Ember from 'ember'`

OrdersRoute = Ember.Route.extend
  model: -> @store.filter 'order', (order) -> order.get('isOrder')
  actions:
    linkTo: (id) -> @transitionTo 'order', id

`export default OrdersRoute`
