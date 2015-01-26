`import Ember from 'ember'`

PlantsImportController = Ember.Controller.extend
  actions:
    importPlants: ->
      plantNames = @get('plantList').split('\n')
      blankLines = (name) => Em.isBlank name
      createPlant = (name) => @store.createRecord('plant', name: name).save()
      Em.RSVP.all(plantNames.reject(blankLines).map(createPlant)).then =>
        @setProperties
          plantList: ''
          shouldShowCreate: no
        @transitionTo 'plants'


    goBack: ->
      @set 'shouldShowCreate', no
      @transitionTo 'plants'
      no


`export default PlantsImportController`
