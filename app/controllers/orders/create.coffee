`import Ember from 'ember'`

OrdersCreateController = Ember.Controller.extend
  actions:
    save: ->
      properties =
        number: @get('content.number')
        customer: @get('content.customer')
        adress: @get('content.adress')
      @store.createRecord('order', properties).save().then (order) =>
        @set 'shouldShowCreate', no
        Em.run.later =>
          @transitionToRoute 'orders'
        , 400


`export default OrdersCreateController`
