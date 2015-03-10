`import Ember from 'ember'`

PlantsCreateController = Ember.ObjectController.extend
  needs: ['plant']
  shouldShowCreate: no
  isNotValid: Em.computed.empty 'content.name'

  actions:
    save: ->
      @get('content').save().then (model) =>
        model.get('positions').forEach (position) ->
          position.save()
        @get('controllers.plant').set 'shouldShowCreate', yes
        Em.run.later =>
          @set 'shouldShowCreate', no
          Em.run.later =>
            @transitionToRoute 'plant', model
          , 400
        , 400
    saveAndRepeat: ->
      @get('content').save().then (plant) =>
        plant.get('positions').forEach (position) ->
          position.save()
        @set 'content', @store.createRecord 'plant'
        $('#createForm').scrollTop(0)
        $('#nameInput').focus()

`export default PlantsCreateController`
