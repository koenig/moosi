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
    goTo: (where) ->
      @set 'actionSheetVisible', no

      nameRouteMap = Em.MapWithDefault.create defaultValue: (key) -> key
      nameRouteMap.set 'import', 'plants.import'
      destination = nameRouteMap.get where
      @transitionToRoute destination


`export default PlantsController`
