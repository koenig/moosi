`import Ember from 'ember'`
`import OrderTabActive from 'moosi/mixins/order-tab-active'`

OrderController = Ember.ObjectController.extend OrderTabActive,
  showPutBacks: no
  adressWithBreaks: Em.computed 'adress', ->
    new Ember.Handlebars.SafeString (@get('adress') or '').replace /(\r\n|\n|\r)/gm, '<br>'

  actions:
    togglePutBacks: ->
      @toggleProperty 'showPutBacks'
      no
    editOrder: ->
      @transitionToRoute 'order.edit', @get 'content'
      no


`export default OrderController`
