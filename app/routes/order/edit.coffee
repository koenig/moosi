`import Ember from 'ember'`

OrderEditRoute = Ember.Route.extend
  actions:
    goBack: ->
      @transitionTo 'order', @modelFor 'order'

`export default OrderEditRoute`
