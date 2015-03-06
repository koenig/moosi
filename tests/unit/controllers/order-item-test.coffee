`import { test, moduleFor } from 'ember-qunit'`

moduleFor 'controller:order-item', 'OrderItemController',
  needs: ['controller:transaction']



# Replace this with your real tests.
test 'it exists', ->
  controller = @subject()
  ok controller

test ' -> #toggleDone', ->
  controller = @subject(content: Em.Object.create(done: no))

  controller.send 'toggleDone'
  equal controller.get('content.done'), yes, 'content.done should be true'

  controller.send 'toggleDone'
  equal controller.get('content.done'), no, 'content.done should be false'

