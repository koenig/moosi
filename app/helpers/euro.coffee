`import Ember from 'ember'`

euro = (value) ->
  value = 0 unless value
  "#{currency(value).format()} €"

EuroHelper = Ember.Handlebars.makeBoundHelper euro

`export { euro }`

`export default EuroHelper`
