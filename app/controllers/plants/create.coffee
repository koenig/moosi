`import Ember from 'ember'`

PlantsCreateController = Ember.ObjectController.extend
  shouldShowCreate: no
  isNotValid: Em.computed.empty 'content.name'

  actions:
    save: ->
      @get('content').save().then (plant) =>
        plant.get('positions').forEach (position) ->
          position.save()
        @set 'shouldShowCreate', no
        Em.run.later( =>
          @transitionTo 'plants'
        , 400)
    saveAndRepeat: ->
      @get('content').save().then (plant) =>
        plant.get('positions').forEach (position) ->
          position.save()
        @set 'content', @store.createRecord 'plant'
        $('#createForm').scrollTop(0)
        $('#nameInput').focus()

`export default PlantsCreateController`
