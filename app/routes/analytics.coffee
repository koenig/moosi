`import Ember from 'ember'`

AnalyticsRoute = Ember.Route.extend
  setupController: (controller, model) ->
    @store.find('position').then (positions) ->
      controller.set 'positions', positions
  actions:
    goBack: ->
      @transitionTo 'plants'


`export default AnalyticsRoute`
