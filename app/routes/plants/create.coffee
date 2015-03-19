`import Ember from 'ember'`

PlantsCreateRoute = Ember.Route.extend
  model: ->
    @store.createRecord 'plant'
  afterModel: (model) ->
    @store.all('quarter').forEach (quarter) =>
      foundQuarter = model.get('positions').find (position) ->
        position.get('quarter') is quarter
      return if foundQuarter
      model.createNewPosition quarter
  actions:
    goBack: ->
      @modelFor('plants.create').destroyRecord()
      @transitionTo 'plants'

`export default PlantsCreateRoute`
