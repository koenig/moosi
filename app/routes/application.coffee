`import Ember from 'ember'`

ApplicationRoute = Ember.Route.extend
  afterModel: ->
    Ember.RSVP.all [
      @store.find 'plant'
      @store.find 'position'

      @store.find 'order'
      @store.find 'orderItem'

      @store.find 'quarter'
    ]
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

    resetTransaction: ->
      @controllerFor('transaction').send 'resetTransaction'

    link: -> @transitionTo.apply @, arguments

`export default ApplicationRoute`
