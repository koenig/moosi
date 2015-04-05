`import Ember from 'ember'`

OrderIndexRoute = Ember.Route.extend
  model: -> @modelFor 'order'


`export default OrderIndexRoute`
