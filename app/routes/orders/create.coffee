`import Ember from 'ember'`

OrdersCreateRoute = Ember.Route.extend
  model: ->
    @store.filter('order', (order) -> not order.get('isPackingList')).then (orders) =>
      orderCount = orders.content.length + 1

      {
        number: orderCount
        customer: null
        adress: null
        date: new Date()
        isNew: yes
      }

  actions:
    goBack: ->
      @transitionTo 'orders'



`export default OrdersCreateRoute`
