`import Ember from 'ember'`

PlantsRoute = Ember.Route.extend
  model: -> @store.find 'plant'
  actions:
    linkToPlant: (plant)-> @transitionTo 'plant', plant



`export default PlantsRoute`
