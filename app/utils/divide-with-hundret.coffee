`import Ember from 'ember'`

divideWithHundret = (property) ->
  Em.computed property, -> @get(property)/100

`export default divideWithHundret`
