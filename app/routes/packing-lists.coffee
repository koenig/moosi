`import Ember from 'ember'`

PackingListsRoute = Ember.Route.extend
  model: -> @store.find 'order'
  actions:
    linkTo: (id) -> @transitionTo 'packing-list', id


`export default PackingListsRoute`
