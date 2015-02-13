`import { test, moduleFor } from 'ember-qunit'`

moduleFor 'controller:order-item', 'OrderItemController',
  needs: ['controller:transaction']



# Replace this with your real tests.
test 'it exists', ->
  controller = @subject()
  ok controller

