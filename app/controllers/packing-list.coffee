`import Ember from 'ember'`

PackingListController = Ember.ObjectController.extend
  showPutBacks: no
  # shouldShowCreate: no

  actions:
    togglePutBacks: ->
      @toggleProperty 'showPutBacks'
      no
    editOrder: ->
      @transitionToRoute 'packing-list.edit', @get 'content'
      no


`export default PackingListController`
