`import Ember from 'ember'`

OrdersRoute = Ember.Route.extend
  model: -> @store.find 'order'

`export default OrdersRoute`
