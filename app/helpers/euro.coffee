`import Ember from 'ember'`

euro = (value) ->
  "#{value.toFixed(2).replace('.', ',')} €"

`export default euro`
