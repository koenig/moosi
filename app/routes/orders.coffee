`import Ember from 'ember'`

OrdersRoute = Ember.Route.extend
  model: -> @store.filter 'order', (order) -> not order.get('isPackingList')
  actions:
    linkTo: (id) -> @transitionTo 'order', id

`export default OrdersRoute`
