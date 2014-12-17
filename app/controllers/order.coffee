`import Ember from 'ember'`

OrderController = Ember.ObjectController.extend
  adressWithBreaks: Em.computed 'adress', ->
    new Handlebars.SafeString @getWithDefault('adress', '').replace /(\r\n|\n|\r)/gm, '<br>'

`export default OrderController`
