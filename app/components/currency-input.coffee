`import Ember from 'ember'`

CurrencyInputComponent = Ember.TextField.extend
  onInit: (->
    value = @get('cents')
    @set "value", currency(value/100).format()
  ).on 'init'
  valueChange: (->
    cents = currency(@get("value")).intValue
    @set "cents", cents
  ).observes "value"

`export default CurrencyInputComponent`
