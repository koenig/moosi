`import Ember from 'ember'`

PlantsCreateRoute = Ember.Route.extend
  model: ->
    @store.createRecord 'plant'

  actions:
    goBack: ->
      @transitionTo 'plants'

`export default PlantsCreateRoute`
