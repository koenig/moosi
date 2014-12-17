`import Ember from 'ember'`

PlantEditRoute = Ember.Route.extend
  actions:
    goBack: ->
      @transitionTo 'plant', @modelFor 'plant'



`export default PlantEditRoute`
