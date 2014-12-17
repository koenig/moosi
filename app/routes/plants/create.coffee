`import Ember from 'ember'`

PlantsCreateRoute = Ember.Route.extend
  model: ->
    @store.createRecord 'plant'

  actions:
    goBack: ->
      @modelFor('plants.create').destroyRecord()
      @transitionTo 'plants'

`export default PlantsCreateRoute`
