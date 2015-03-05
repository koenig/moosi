`import Ember from 'ember'`

PackingListRoute = Ember.Route.extend
  controllerName: 'order'
  renderTemplate: -> @render 'order'
  afterModel: (model, transition) ->
    @updateStateTo transition, 'packing-list', model.get('id')
  actions:
    willTransition: (transition) ->
      @updateStateTo transition, 'packing-list', no
    goBack: ->
      @transitionTo 'packing-lists'
  model: (params) ->
    @store.find 'order', params.packing_list_id

`export default PackingListRoute`
