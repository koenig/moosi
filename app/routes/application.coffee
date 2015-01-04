`import Ember from 'ember'`

ApplicationRoute = Ember.Route.extend
  actions:
    goToOrders: ->
      if @get 'orderState'
        @transitionTo 'order', @get 'orderState'
      else
        @transitionTo 'orders'
    goToPlants: ->
      if @get 'plantState'
        @transitionTo 'plant', @get 'plantState'
      else
        @transitionTo 'plants'

    setOrderState: (newState) ->
      @set 'orderState', newState
    setPlantState: (newState) ->
      @set 'plantState', newState

    deselectActiveOrder: ->
      @controllerFor('application').set 'activeOrder', null
      console.log 'deselect'

`export default ApplicationRoute`
