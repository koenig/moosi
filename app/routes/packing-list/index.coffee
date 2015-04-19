`import Ember from 'ember'`

PackingListIndexRoute = Ember.Route.extend
  model: -> @modelFor 'packing-list'

`export default PackingListIndexRoute`
