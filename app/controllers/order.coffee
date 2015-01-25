`import Ember from 'ember'`
`import OrderTabActive from 'moosi/mixins/order-tab-active'`

OrderController = Ember.ObjectController.extend OrderTabActive,
  adressWithBreaks: Em.computed 'adress', ->
    new Handlebars.SafeString (@get('adress') or '').replace /(\r\n|\n|\r)/gm, '<br>'

  actions:
    editOrder: ->
      @transitionToRoute 'order.edit', @get 'content'
      no


`export default OrderController`
