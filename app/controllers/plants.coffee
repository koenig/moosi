`import Ember from 'ember'`

PlantsController = Ember.ArrayController.extend
  sortProperties: ['name']
  sortAscending: yes
  modalVisible: no
  actionSheetVisible: no
  actions:
    openmodal: ->
      console.log 'jo'
      @set 'modalVisible', yes
    openActionSheet: ->
      @set 'actionSheetVisible', yes
    goToQuarters: ->
      @set 'actionSheetVisible', no
      @transitionToRoute 'quarters'
      console.log 'goint to Quarters'

`export default PlantsController`
