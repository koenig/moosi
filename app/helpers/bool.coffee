`import Ember from 'ember'`

bool = (value) ->
  return 'ja' if value
  'nein'

BoolHelper = Ember.Handlebars.makeBoundHelper bool

`export { bool }`

`export default BoolHelper`
