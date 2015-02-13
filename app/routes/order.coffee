`import Ember from 'ember'`

OrderRoute = Ember.Route.extend
  afterModel: (order, transition) ->
    if 'order' is transition.targetName.substring 0, 5
      transition.send 'setOrderState', order.get('id')
  actions:
    willTransition: (transition) ->
      if 'order' is transition.targetName.substring 0, 5
        transition.send 'setOrderState', false
    goBack: ->
      @transitionTo 'orders'


`export default OrderRoute`
