`import Ember from 'ember'`

date = (date) ->
  new Date(date).toLocaleDateString()

DateHelper = Ember.Handlebars.makeBoundHelper date

`export { date }`

`export default DateHelper`
