`import Ember from 'ember'`

PlantsController = Ember.Controller.extend
  modalVisible: no
  actions:
    openmodal: ->
      console.log 'jo'
      @set 'modalVisible', yes

`export default PlantsController`
