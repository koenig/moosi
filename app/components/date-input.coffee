`import Ember from 'ember'`

DateInputComponent = Ember.TextField.extend
  onInit: ( ->
    date = new Date @get('date')
    [year, month, day] = [date.getFullYear(), (date.getMonth()+1), date.getDate()]
    month = "0#{month}" if month < 10
    day = "0#{day}" if day < 10
    @set "value", "#{year}-#{month}-#{day}"
  ).on 'init'
  valueChange: (->
    date = new Date @get('value')
    @set "date", date
  ).observes("value")


`export default DateInputComponent`
