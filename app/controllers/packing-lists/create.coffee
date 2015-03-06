`import Ember from 'ember'`

PackingListsCreateController = Ember.Controller.extend
  actions:
    save: ->
      properties =
        number: @get('content.number')
        customer: @get('content.customer')
        adress: @get('content.adress')
        isPackingList: yes
      @store.createRecord('order', properties).save().then (order) =>
        @set 'shouldShowCreate', no
        Em.run.later =>
          @transitionToRoute 'packing-lists'
        , 400


`export default PackingListsCreateController`
