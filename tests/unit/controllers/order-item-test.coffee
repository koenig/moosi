`import { test, moduleFor } from 'ember-qunit'`

moduleFor 'controller:order-item', 'OrderItemController',
  needs: ['controller:transaction']



# Replace this with your real tests.
test 'it exists', ->
  controller = @subject()
  ok controller

test ' -> #toggleDone', ->
  orderItem = Em.Object.create done: no, save: ->
  controller = @subject content: orderItem

  controller.send 'toggleDone'
  equal orderItem.get('done'), yes, 'orderItem.done should be true'

  controller.send 'toggleDone'
  equal orderItem.get('done'), no, 'orderItem.done should be false'

