`import Ember from 'ember'`
`import AccessActiveOrderMixin from 'moosi/mixins/access-active-order'`


PlantsController = Ember.ArrayController.extend AccessActiveOrderMixin,
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
