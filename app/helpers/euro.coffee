`import Ember from 'ember'`

euro = (value) ->
  return 0 unless value
  "#{currency(value).format()} €"

`export default euro`
