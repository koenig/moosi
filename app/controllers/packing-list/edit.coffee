`import Ember from 'ember'`

PackingListEditController = Ember.Controller.extend
  isNotDeletable: Em.computed 'content.orderItems.[]', ->
    @get('content.orderItems.length') > 0
  actions:
    save: ->
      @get('content').save().then =>
        @set 'shouldShowCreate', no
        Em.run.later( =>
          @send 'goBack'
        , 400)
    goIntoDeleteMode: ->
      @set 'deleteMode', yes
    leaveDeleteMode: ->
      @set 'deleteMode', no
    deleteOrder: ->
      @get('content').destroyRecord().then =>
        @set 'shouldShowCreate', no
        @set 'deleteMode', no
        Em.run.later( =>
          @transitionToRoute 'orders'
        , 400)
    goBack: ->
      @get('content').rollback()
      @set 'shouldShowCreate', no
      @transitionToRoute 'packing-list'


`export default PackingListEditController`
