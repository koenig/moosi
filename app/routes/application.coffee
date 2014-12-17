`import Ember from 'ember'`

ApplicationRoute = Ember.Route.extend
  onOrderStateChange: (->
    console.log 'changed', @get 'orderState'
  ).observes 'orderState'
  actions:
    goToOrders: ->
      console.log 'go to orders'
      if @get 'orderState'
        @transitionTo 'order', @get 'orderState'
      else
        @transitionTo 'orders'
    goToPlants: ->
      console.log 'go to plants'
      if @get 'plantState'
        @transitionTo 'plant', @get 'plantState'
      else
        @transitionTo 'plants'

    setOrderState: (newState) ->
      @set 'orderState', newState
    setPlantState: (newState) ->
      @set 'plantState', newState

`export default ApplicationRoute`
