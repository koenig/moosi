`import Ember from 'ember'`

OrdersCreateController = Ember.Controller.extend
  actions:
    save: ->
      @get('content').save().then (plant) =>
        @set 'shouldShowCreate', no
        Em.run.later( =>
          @send 'goBack'
        , 400)


`export default OrdersCreateController`
