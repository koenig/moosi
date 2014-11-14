`import Ember from 'ember'`

QuartersRoute = Ember.Route.extend
  model: -> @store.find 'quarter'
  actions:
    goBack: ->
      @transitionTo 'plants'


`export default QuartersRoute`
