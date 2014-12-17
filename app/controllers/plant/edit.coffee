`import Ember from 'ember'`

PlantEditController = Ember.ObjectController.extend
  shouldShowCreate: no
  actions:
    save: ->
      console.log 'saving'
      @get('content').save().then (plant) =>
        plant.get('positions').forEach (position) ->
          position.save()
        @set 'shouldShowCreate', no
        Em.run.later( =>
          @send 'goBack'
        , 400)


`export default PlantEditController`
