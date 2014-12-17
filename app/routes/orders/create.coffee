`import Ember from 'ember'`

OrdersCreateRoute = Ember.Route.extend
  model: ->
    @store.createRecord 'order'

  actions:
    goBack: ->
      @transitionTo 'orders'


`export default OrdersCreateRoute`
