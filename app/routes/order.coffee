`import Ember from 'ember'`

OrderRoute = Ember.Route.extend
  actions:
    goBack: ->
      @transitionTo 'orders'


`export default OrderRoute`
