`import Ember from 'ember'`

QuartersController = Ember.ArrayController.extend
  selectedQuarter:
    name: ''
  editMode: no
  actions:
    createQuarter: ->
      if @get 'editMode'
        @get('selectedQuarter').save()
      else
        quarter = @store.createRecord 'quarter',
          name: @get 'selectedQuarter.name'

        quarter.one 'didCreate', (quarter) =>
          @store.find('plant').then (plants) =>
            plants.forEach (plant) ->
              plant.createNewPosition quarter

        quarter.save()
      @setProperties
        selectedQuarter: name: null
        editMode: no

    rename: (quarter) ->
      @setProperties
        selectedQuarter: quarter
        editMode: yes

`export default QuartersController`
