`import Ember from 'ember'`

PlantRoute = Ember.Route.extend
  afterModel: (model, transition) ->
    if 'plant' is transition.targetName.substring 0, 5
      transition.send 'setPlantState', model.get('id')
  willTransition: (transition) ->
    if 'plant' is transition.targetName.substring 0, 5
      transition.send 'setPlantState', false

  actions:
    goBack: ->
      @transitionTo 'plants'


`export default PlantRoute`
