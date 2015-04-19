`import Ember from 'ember'`

PlantIndexRoute = Ember.Route.extend
  model: -> @modelFor 'plant'

`export default PlantIndexRoute`
