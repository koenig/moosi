`import Ember from 'ember'`

euro = (value) ->
  value = 0 unless value
  "#{currency(value).format()} €"

`export default euro`
