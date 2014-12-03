`import Ember from 'ember'`

PlantController = Ember.ObjectController.extend
  needs: ['transaction']
  transaction: Em.computed.alias 'controllers.transaction'

  # hasFrom:
  # actions:
  #   selectPosition: (position) ->
  #     console.log 'selectQuarter'
  #     @set 'transaction.from', position

`export default PlantController`
