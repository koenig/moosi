`import Ember from 'ember'`
`import OrderTabActive from 'moosi/mixins/order-tab-active'`

OrderEditController = Ember.Controller.extend OrderTabActive,
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
        Em.run.later( =>
          @transitionTo 'orders'
        , 400)
    goBack: ->
      @get('content').rollback()
      @set 'shouldShowCreate', no
      @transitionTo 'order'

`export default OrderEditController`
