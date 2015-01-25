`import Ember from 'ember'`

QuarterController = Ember.ObjectController.extend
  needs: ['quarters']
  quarters: Em.computed.alias 'controllers.quarters'
  isActive: Em.computed 'quarters.selectedQuarter', ->
    @get('quarters.selectedQuarter') is @get('content')

`export default QuarterController`
