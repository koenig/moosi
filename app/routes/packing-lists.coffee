`import Ember from 'ember'`

PackingListsRoute = Ember.Route.extend
  controllerName: 'orders'
  renderTemplate: -> @render 'orders'
  model: -> @store.find 'order'
  actions:
    linkToOrder: (id) -> @transitionTo 'packing-list', id


`export default PackingListsRoute`
