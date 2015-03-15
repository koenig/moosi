`import Ember from 'ember'`

PackingListsCreateController = Ember.Controller.extend
  needs: ['packing-list']
  actions:
    save: ->
      properties =
        number: @get('content.number')
        customer: @get('content.customer')
        adress: @get('content.adress')
        isPackingList: yes
      @store.createRecord('order', properties).save().then (model) =>
        @get('controllers.packing-list').set 'shouldShowCreate', no
        Em.run.later =>
          @set 'shouldShowCreate', no
          Em.run.later =>
            @transitionToRoute 'packing-list', model
          , 300
        , 300


`export default PackingListsCreateController`
