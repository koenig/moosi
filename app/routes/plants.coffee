`import Ember from 'ember'`

PlantsRoute = Ember.Route.extend
  model: -> @store.filter 'plant', (plant) -> not plant.get('isNew')
  actions:
    linkToPlant: (plant)-> @transitionTo 'plant', plant



`export default PlantsRoute`
