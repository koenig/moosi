`import Ember from 'ember'`

PlantsCreateRoute = Ember.Route.extend
  model: -> Em.Object.create()
  actions:
    goBack: ->
      @transitionTo 'plants'

`export default PlantsCreateRoute`
