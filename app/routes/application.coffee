`import Ember from 'ember'`

ApplicationRoute = Ember.Route.extend
  afterModel: ->
    @store.find 'plant'
    @store.find 'position'

    @store.find 'order'
    @store.find 'orderItem'

    @store.find 'quarter'
  actions:
    goTo: (whereTo) ->
      if @get "#{whereTo}State"
        @controllerFor(whereTo).set 'shouldShowCreate', yes
        @transitionTo whereTo.dasherize(), @get "#{whereTo}State"
      else
        @transitionTo "#{whereTo.pluralize().dasherize()}"

    setState: (name, newState) ->
      @set "#{name}State", newState

    selectActiveOrder: (order) ->
      @controllerFor('application').set 'activeOrder', order
      @send 'goTo', 'plant'
    deselectActiveOrder: ->
      @controllerFor('application').set 'activeOrder', null
      @controllerFor('transaction').send 'resetTransaction'

    resetTransaction: ->
      @controllerFor('transaction').send 'resetTransaction'


`export default ApplicationRoute`
