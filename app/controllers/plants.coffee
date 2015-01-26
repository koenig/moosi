`import Ember from 'ember'`
`import AccessActiveOrderMixin from 'moosi/mixins/access-active-order'`


PlantsController = Ember.ArrayController.extend AccessActiveOrderMixin,
  sortProperties: ['name']
  sortAscending: yes
  filteredContent: Em.computed.filterBy 'arrangedContent', 'isNew', no
  modalVisible: no
  actionSheetVisible: no
  actions:
    openmodal: ->
      @set 'modalVisible', yes
    openActionSheet: ->
      @set 'actionSheetVisible', yes
    goToQuarters: ->
      @set 'actionSheetVisible', no
      @transitionToRoute 'quarters'
    goToImport: ->
      @set 'actionSheetVisible', no
      @transitionToRoute 'plants.import'

`export default PlantsController`
