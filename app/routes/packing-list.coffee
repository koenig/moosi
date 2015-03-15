`import Ember from 'ember'`

PackingListRoute = Ember.Route.extend
  model: (params) ->
    @store.find('order', params.packing_list_id).catch =>
      @transitionTo('packing-lists')
  afterModel: (model, transition) ->
    @updateStateTo transition, 'packing-list', model.get('id')
  actions:
    willTransition: (transition) ->
      @updateStateTo transition, 'packing-list', no
    goBack: ->
      @transitionTo 'packing-lists'

`export default PackingListRoute`
