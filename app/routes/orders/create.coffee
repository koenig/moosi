`import Ember from 'ember'`

OrdersCreateRoute = Ember.Route.extend
  model: ->
    @store.find('order').then (orders) =>
      orderCount = orders.content.length + 1
      # @store.createRecord 'order',

      {
        name: "Bestellung Nr. #{orderCount}"
        number: orderCount
        customer: null
        adress: null
      }

  actions:
    goBack: ->
      @transitionTo 'orders'



`export default OrdersCreateRoute`
