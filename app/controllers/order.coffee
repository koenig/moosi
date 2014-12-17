`import Ember from 'ember'`

OrderController = Ember.ObjectController.extend
  adressWithBreaks: Em.computed 'adress', ->
    new Handlebars.SafeString @getWithDefault('adress', '').replace '\n', '</br>'

`export default OrderController`
