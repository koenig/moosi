`import Ember from 'ember'`

PlantRoute = Ember.Route.extend
  afterModel: (model, transition) ->
    @updateStateTo transition, 'plant', model.get('id')
  actions:
    willTransition: (transition) ->
      @updateStateTo transition, 'plant', no
    goBack: ->
      @transitionTo 'plants'


`export default PlantRoute`
