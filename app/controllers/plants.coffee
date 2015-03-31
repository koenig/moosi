`import Ember from 'ember'`
`import AccessActiveOrderMixin from 'moosi/mixins/access-active-order'`


PlantsController = Ember.ArrayController.extend AccessActiveOrderMixin,
  sortProperties: ['name']
  sortAscending: yes
  modalVisible: no
  actionSheetVisible: no
  showSearchField: no

  searchString: ''
  onSearchStringChange: (->
    searchString = @get('searchString').toLowerCase()
    @get('arrangedContent').forEach (plant) =>
      plant.set 'hideOnPlantsList', Em.isBlank plant.get('searchName').match searchString
  ).observes 'searchString'
  actions:
    openmodal: ->
      @set 'modalVisible', yes
    openActionSheet: ->
      @set 'actionSheetVisible', yes
    toggleSearch: ->
      @toggleProperty 'showSearchField'
      no
    goTo: (where) ->
      @set 'actionSheetVisible', no

      nameRouteMap = Em.MapWithDefault.create defaultValue: (key) -> key
      nameRouteMap.set 'import', 'plants.import'
      destination = nameRouteMap.get where
      @transitionToRoute destination


`export default PlantsController`
