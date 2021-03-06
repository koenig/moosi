`import Ember from 'ember'`

PlantEditController = Ember.ObjectController.extend
  shouldShowCreate: no
  actions:
    save: ->
      @get('content').save().then (plant) =>
        plant.get('positions').forEach (position) ->
          position.save()
        @set 'shouldShowCreate', no
        Em.run.later( =>
          @send 'goBack'
        , 400)
    goIntoDeleteMode: ->
      @set 'deleteMode', yes
    leaveDeleteMode: ->
      @set 'deleteMode', no
    deleteOrder: ->
      @get('content').destroyRecord().then =>
        @set 'shouldShowCreate', no
        @set 'deleteMode', no
        Em.run.later( =>
          @transitionToRoute 'plants'
        , 400)
    goBack: ->
      @get('content').rollback()
      @set 'shouldShowCreate', no
      @transitionToRoute 'plant'
      no




`export default PlantEditController`
