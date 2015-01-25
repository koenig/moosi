`import Ember from 'ember'`

CurrencyInputComponent = Ember.TextField.extend
  init: ->
    @_super()
    value = currency(@get('currency')).format()
    @set "value", value

  updateCurrency: (->
    cents = currency(@get("value")).intValue
    @set "currency", cents
  ).observes("value")

`export default CurrencyInputComponent`
