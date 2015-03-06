`import Ember from 'ember'`
`import AccessActiveOrderMixin from 'moosi/mixins/access-active-order'`

PlantController = Ember.ObjectController.extend AccessActiveOrderMixin,
  needs: ['transaction']
  shouldShowCreate: no

  transaction: Em.computed.alias 'controllers.transaction'
  hasFrom: Em.computed.bool 'transaction.from'
  hasTo: Em.computed.bool 'transaction.to'
  hasTransaction: Em.computed.or 'hasFrom', 'hasTo'
  isTransaction: Em.computed.alias 'transaction.isRealTransaction'

  doAction: Em.computed 'hasFrom', ->
    return ' wie viele?' if @get 'hasFrom'
    ' wähle das Lager'

  actions:
    execute: ->
      @get('transaction').execute()

    resetTransaction: ->
      @get('transaction').send 'resetTransaction'

    editPlant: ->
      @transitionToRoute 'plant.edit', @get 'content'

    goBack: ->
      @get('transaction').send 'resetTransaction'
      yes

`export default PlantController`
