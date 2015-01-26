`import Ember from 'ember'`

CurrencyInputComponent = Ember.TextField.extend
  onInit: (->
    value = currency(@get('currency')).format()
    @set "value", value
  ).on 'init'
  valueChange: (->
    cents = currency(@get("value")).intValue
    @set "currency", cents
  ).observes("value")

`export default CurrencyInputComponent`
