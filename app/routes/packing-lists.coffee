`import Ember from 'ember'`

PackingListsRoute = Ember.Route.extend
  model: -> @store.filter 'order', (order) -> order.get('isPackingList')
  actions:
    linkTo: (id) -> @transitionTo 'packing-list', id


`export default PackingListsRoute`
