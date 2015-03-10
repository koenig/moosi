`import Ember from 'ember'`

AnalyticsController = Ember.Controller.extend
  plantPositions: Em.computed.filterBy 'positions', 'isPlant'
  plantQuantities: Em.computed.mapBy 'plantPositions', 'quantity'
  plantCount: Em.computed.sum 'plantQuantities'

  youngPlantPositions: Em.computed.filterBy 'positions', 'isYoung'
  youngPlantQuantities: Em.computed.mapBy 'youngPlantPositions', 'quantity'
  youngPlantCount: Em.computed.sum 'youngPlantQuantities'

`export default AnalyticsController`
