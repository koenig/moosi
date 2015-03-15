`import Ember from 'ember'`

QuartersController = Ember.ArrayController.extend
  selectedQuarter:
    name: ''
  editMode: no
  resetSelection: ->
    @setProperties
      selectedQuarter: name: '', isYoung: no
      editMode: no
  actions:
    createQuarter: ->
      if @get 'editMode'
        @get('selectedQuarter').save()
      else
        quarter = @store.createRecord 'quarter',
          name: @get 'selectedQuarter.name'

        quarter.save()
      @resetSelection()

    rename: (quarter) ->
      @setProperties
        selectedQuarter: quarter
        editMode: yes
    stopRename: ->
      @get('selectedQuarter').rollback() if @get('selectedQuarter.isDirty')
      @resetSelection()

    goBack: ->
      @send 'stopRename'
      yes

    toggleIsYoung: ->
      @toggleProperty 'selectedQuarter.isYoung'
      no

`export default QuartersController`
