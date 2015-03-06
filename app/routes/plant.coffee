`import Ember from 'ember'`

PlantRoute = Ember.Route.extend
  model: (params) ->
    @store.find('plant', params.plant_id).catch =>
      @transitionTo('plants')
  afterModel: (model, transition) ->
    @updateStateTo transition, 'plant', model.get('id')
  actions:
    willTransition: (transition) ->
      @updateStateTo transition, 'plant', no
    goBack: ->
      @transitionTo 'plants'


`export default PlantRoute`
