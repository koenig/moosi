`import Ember from 'ember'`

AnalyticsRoute = Ember.Route.extend
  actions:
    goBack: ->
      @transitionTo 'plants'


`export default AnalyticsRoute`
