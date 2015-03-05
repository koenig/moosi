`import Ember from 'ember'`

OrderRoute = Ember.Route.extend
  afterModel: (model, transition) ->
    @updateStateTo transition, 'order', model.get('id')
  actions:
    willTransition: (transition) ->
      @updateStateTo transition, 'order', false
    goBack: ->
      @transitionTo 'orders'


`export default OrderRoute`
