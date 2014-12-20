`import Ember from 'ember'`

QuartersController = Ember.ArrayController.extend
  selectedQuarter:
    name: ''
  actions:
    createQuarter: ->
      console.log 'createQuarter'
      @store.createRecord('quarter',
        name: @get 'selectedQuarter.name'
      ).save()

`export default QuartersController`
