`import Ember from 'ember'`
`import OrderTabActive from 'moosi/mixins/order-tab-active'`

OrdersCreateController = Ember.Controller.extend OrderTabActive,
  actions:
    save: ->
      properties =
        number: @get('content.number')
        customer: @get('content.customer')
        adress: @get('content.adress')
      @store.createRecord('order', properties).save().then (plant) =>
        @set 'shouldShowCreate', no
        Em.run.later =>
          @transitionToRoute 'orders'
        , 400


`export default OrdersCreateController`
