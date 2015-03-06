`import Ember from 'ember'`

OrderController = Ember.ObjectController.extend
  showPutBacks: no
  shouldShowCreate: no
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
