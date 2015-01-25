`import Ember from 'ember'`
`import OrderTabActive from 'moosi/mixins/order-tab-active'`

OrderController = Ember.ObjectController.extend OrderTabActive,
  adressWithBreaks: Em.computed 'adress', ->
    new Handlebars.SafeString (@get('adress') or '').replace /(\r\n|\n|\r)/gm, '<br>'

`export default OrderController`
