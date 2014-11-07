`import Ember from 'ember'`

PlantsCreateController = Ember.Controller.extend
  shouldShowCreate: no
  actions:
    save: ->
      new_plant = @store.createRecord 'plant',
        name: @get 'content.name'
        price: @get 'content.price'
      new_plant.save().then =>
        @set 'shouldShowCreate', no
        Em.run.later( =>
          @send 'goBack'
        , 400)


`export default PlantsCreateController`
