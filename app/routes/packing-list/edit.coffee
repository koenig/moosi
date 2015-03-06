`import Ember from 'ember'`

PackingListEditRoute = Ember.Route.extend
  actions:
    goBack: ->
      @transitionTo 'packing-list', @modelFor 'packing-list'


`export default PackingListEditRoute`
