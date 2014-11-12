`import Ember from 'ember'`

PlantsController = Ember.Controller.extend
  modalVisible: no
  actionSheetVisible: no
  actions:
    openmodal: ->
      console.log 'jo'
      @set 'modalVisible', yes
    openActionSheet: ->
      @set 'actionSheetVisible', yes

`export default PlantsController`
