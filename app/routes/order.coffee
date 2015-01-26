`import Ember from 'ember'`

OrderRoute = Ember.Route.extend
  afterModel: (model, transition) ->
    if 'order' is transition.targetName.substring 0, 5
      transition.send 'setOrderState', model.get('id')
  actions:
    willTransition: (transition) ->
      if 'order' is transition.targetName.substring 0, 5
        transition.send 'setOrderState', false
    goBack: ->
      @transitionTo 'orders'


`export default OrderRoute`
