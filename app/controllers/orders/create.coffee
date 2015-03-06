`import Ember from 'ember'`

OrdersCreateController = Ember.Controller.extend
  needs: ['order']
  actions:
    save: ->
      properties =
        number: @get('content.number')
        customer: @get('content.customer')
        adress: @get('content.adress')
      @store.createRecord('order', properties).save().then (model) =>
        @get('controllers.order').set 'shouldShowCreate', no
        Em.run.later =>
          @set 'shouldShowCreate', no
          Em.run.later =>
            @transitionToRoute 'order', model
          , 400
        , 400


`export default OrdersCreateController`
