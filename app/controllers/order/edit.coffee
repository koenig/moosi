`import Ember from 'ember'`
`import OrderTabActive from 'moosi/mixins/order-tab-active'`

OrderEditController = Ember.Controller.extend OrderTabActive,
  actions:
    save: ->
      @get('content').save().then (order) =>
        @set 'shouldShowCreate', no
        Em.run.later( =>
          @send 'goBack'
        , 400)

`export default OrderEditController`
