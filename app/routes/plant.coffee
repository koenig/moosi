`import Ember from 'ember'`

PlantRoute = Ember.Route.extend
  afterModel: (plant, transition) ->
    if 'plant' is transition.targetName.substring 0, 5
      transition.send 'setPlantState', plant.get('id')
  actions:
    willTransition: (transition) ->
      if 'plant' is transition.targetName.substring 0, 5
        transition.send 'setPlantState', false
    goBack: ->
      @transitionTo 'plants'


`export default PlantRoute`
