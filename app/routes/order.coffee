`import Ember from 'ember'`

OrderRoute = Ember.Route.extend
  model: (params) ->
    @store.find('order', params.order_id).catch =>
      @transitionTo('orders')
  afterModel: (model, transition) ->
    @updateStateTo transition, 'order', model.get('id')
  actions:
    willTransition: (transition) ->
      @updateStateTo transition, 'order', false
    goBack: ->
      @transitionTo 'orders'


`export default OrderRoute`
