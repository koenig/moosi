`import Ember from 'ember'`

euro = (value) ->
  "#{parseFloat(value).toFixed(2).replace('.', ',')} €"

`export default euro`
