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

  orderedPositions: Em.computed.sort 'positions', (a, b) ->
    aId = a.get('quarter.id')
    bId = b.get('quarter.id')
    return 1 if aId > bId
    return -1 if  aId < bId
    0

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

    toggle: (property) ->
      @toggleProperty property
      @get('content').save()
      no

`export default PlantController`
