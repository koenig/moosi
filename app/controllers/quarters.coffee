`import Ember from 'ember'`

QuartersController = Ember.ArrayController.extend
  selectedQuarter:
    name: ''
  editMode: no
  actions:
    createQuarter: ->
      console.log 'createQuarter'
      if @get 'editMode'
        @get('selectedQuarter').save()
      else
        @store.createRecord('quarter',
          name: @get 'selectedQuarter.name'
        ).save()

      @setProperties
        selectedQuarter: name: null
        editMode: no

    rename: (quarter) ->
      @setProperties
        selectedQuarter: quarter
        editMode: yes

`export default QuartersController`
