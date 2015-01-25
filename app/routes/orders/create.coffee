`import Ember from 'ember'`

OrdersCreateRoute = Ember.Route.extend
  model: ->
    @store.find('order').then (orders) =>
      orderCount = orders.content.length + 1

      {
        number: orderCount
        customer: null
        adress: null
        isNew: yes
      }

  actions:
    goBack: ->
      @transitionTo 'orders'



`export default OrdersCreateRoute`
