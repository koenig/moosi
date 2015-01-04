`import Ember from 'ember'`

OrderItemController = Ember.ObjectController.extend
  total: Em.computed 'content.plant.price', 'content.quantity', ->
    @get('content.plant.price') * @get('content.quantity')

`export default OrderItemController`
