`import Ember from 'ember'`

ApplicationRoute = Ember.Route.extend
  afterModel: ->
    @store.find 'quarter', everything: true
  actions:
    goTo: (whereTo) ->
      whereToCamelized = whereTo.camelize()
      if @get "#{whereToCamelized}State"
        @controllerFor(whereTo).set 'shouldShowCreate', yes
        @transitionTo whereTo.dasherize(), @get "#{whereToCamelized}State"
      else
        @transitionTo "#{whereTo.pluralize().dasherize()}"

    setState: (name, newState) ->
      @set "#{name.camelize()}State", newState

    selectActiveOrder: (order) ->
      @controllerFor('application').set 'activeOrder', order
      @send 'goTo', 'plant'
    deselectActiveOrder: ->
      @controllerFor('application').set 'activeOrder', null
      @controllerFor('transaction').send 'resetTransaction'
      no

    resetTransaction: ->
      @controllerFor('transaction').send 'resetTransaction'

    link: -> @transitionTo.apply @, arguments

`export default ApplicationRoute`
