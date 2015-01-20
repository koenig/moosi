`import Ember from 'ember'`

PlantsCreateController = Ember.ObjectController.extend
  shouldShowCreate: no
  actions:
    save: ->
      @get('content').save().then (plant) =>
        # console.log 'saved', plant, plant.get('positions.length'), plant.get('positions')
        plant.get('positions').forEach (position) ->
          position.save()
        @set 'shouldShowCreate', no
        Em.run.later( =>
          @transitionTo 'plants'
        , 400)


`export default PlantsCreateController`
