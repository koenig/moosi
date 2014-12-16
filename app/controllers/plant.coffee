`import Ember from 'ember'`

PlantController = Ember.ObjectController.extend
  needs: ['transaction']
  transaction: Em.computed.alias 'controllers.transaction'
  hasFrom: Em.computed.bool 'transaction.from'
  hasTo: Em.computed.bool 'transaction.to'
  hasTransaction: Em.computed.or 'hasFrom', 'hasTo'
  isTransaction: Em.computed.alias 'transaction.isRealTransaction'

  actions:
    execute: ->
      @get('transaction').execute()

    resetTransaction: ->
      @get('transaction').send 'resetTransaction'

`export default PlantController`
