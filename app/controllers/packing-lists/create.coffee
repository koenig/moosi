`import Ember from 'ember'`

PackingListsCreateController = Ember.Controller.extend
  actions:
    save: ->
      properties =
        number: @get('content.number')
        customer: @get('content.customer')
        adress: @get('content.adress')
        isPackingList: yes
      @store.createRecord('order', properties).save().then (model) =>
        @set 'shouldShowCreate', no
        Em.run.later =>
          @controllerFor('packing-list').set 'shouldShowCreate', yes
          @transitionToRoute 'packing-list', model
        , 400


`export default PackingListsCreateController`
