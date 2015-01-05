`import Ember from 'ember'`

OrdersCreateController = Ember.Controller.extend
  actions:
    save: ->
      @store.createRecord('order', @get('content')).save().then (plant) =>
        @set 'shouldShowCreate', no
        Em.run.later =>
          @transitionToRoute 'orders'
        , 400


`export default OrdersCreateController`
