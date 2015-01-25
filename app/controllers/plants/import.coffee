`import Ember from 'ember'`

PlantsImportController = Ember.Controller.extend
  actions:
    importPlants: ->
      plantNames = @get('plantList').split('\n')
      plantNames.forEach (name) =>
        return if Em.isBlank name
        @store.createRecord('plant', name: name).save()

`export default PlantsImportController`
