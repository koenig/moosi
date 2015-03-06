`import Ember from 'ember'`

PackingListsCreateRoute = Ember.Route.extend
  model: ->
    {
      customer: null
      adress: null
      date: new Date()
      isNew: yes
      isPackingList: yes
    }

  actions:
    goBack: ->
      @transitionTo 'packing-lists'

`export default PackingListsCreateRoute`
