`import Ember from 'ember'`
`import OrderTabActive from 'moosi/mixins/order-tab-active'`

OrdersCreateController = Ember.Controller.extend OrderTabActive,
  actions:
    save: ->
      @store.createRecord('order', @get('content')).save().then (plant) =>
        @set 'shouldShowCreate', no
        Em.run.later =>
          @transitionToRoute 'orders'
        , 400


`export default OrdersCreateController`
