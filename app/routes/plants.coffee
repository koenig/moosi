`import Ember from 'ember'`

PlantsRoute = Ember.Route.extend
  model: -> @store.find 'plant'



`export default PlantsRoute`
