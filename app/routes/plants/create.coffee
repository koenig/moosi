`import Ember from 'ember'`

PlantsCreateRoute = Ember.Route.extend
  model: ->
    result = Em.Object.create()
    result.set 'positions', []

    quarters = @store.find 'quarter'
    quarters.forEach (quarter) ->
      result.get('positions').pushObject
        quarter: quarter
        name: quarter.name
        quantiy: 0
    result
  actions:
    goBack: ->
      @transitionTo 'plants'

`export default PlantsCreateRoute`
