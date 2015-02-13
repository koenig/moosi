`import Ember from 'ember'`

ApplicationRoute = Ember.Route.extend
  afterModel: ->
    @store.find 'plant'
    @store.find 'position'

    @store.find 'order'
    @store.find 'orderItem'

    @store.find 'quarter'
  actions:
    goToOrders: ->
      if @get 'orderState'
        @controllerFor('order').set 'shouldShowCreate', yes
        @transitionTo 'order', @get 'orderState'
      else
        @transitionTo 'orders'
    goToPlants: ->
      if @get 'plantState'
        @controllerFor('plant').set 'shouldShowCreate', yes
        @transitionTo 'plant', @get 'plantState'
      else
        @transitionTo 'plants'

    setOrderState: (newState) ->
      @set 'orderState', newState
    setPlantState: (newState) ->
      @set 'plantState', newState

    deselectActiveOrder: ->
      @controllerFor('application').set 'activeOrder', null
      @controllerFor('transaction').send 'resetTransaction'

    resetTransaction: ->
      @controllerFor('transaction').send 'resetTransaction'


`export default ApplicationRoute`
