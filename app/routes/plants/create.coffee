`import Ember from 'ember'`

PlantsCreateRoute = Ember.Route.extend
  actions:
    goBack: ->
      @transitionTo 'plants'

`export default PlantsCreateRoute`
