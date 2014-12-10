`import Ember from 'ember'`

PlantController = Ember.ObjectController.extend
  needs: ['transaction']
  transaction: Em.computed.alias 'controllers.transaction'
  isTransaction: Em.computed 'transaction.from', 'transaction.to', ->
    @get('transaction.to') isnt @get('transaction.from')

  actions:
    execute: ->
      @get('transaction').execute()

    resetTransaction: ->
      @get('transaction').send 'resetTransaction'

`export default PlantController`