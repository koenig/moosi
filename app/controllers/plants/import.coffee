`import Ember from 'ember'`

PlantsImportController = Ember.Controller.extend
  plantsImportUrl: (adapter) ->
    adapter.buildURL 'plants', 'import'
  actions:
    importPlants: ->
      blankLines = (name) => Em.isBlank name
      plantNames = @get('plantList').split('\n').reject(blankLines)
      adapter = @store.adapterFor('application')
      adapter.ajax(@plantsImportUrl(adapter), 'POST', {data:{names: plantNames}}).then (payload) =>
        @store.pushMany('plant', @store.normalize('plant', payload['plants']))
        @store.pushMany('position', @store.normalize('position', payload['positions']))

        @setProperties
          plantList: ''
          shouldShowCreate: no
        @transitionToRoute 'plants'


    goBack: ->
      @set 'shouldShowCreate', no
      @transitionToRoute 'plants'
      no


`export default PlantsImportController`
