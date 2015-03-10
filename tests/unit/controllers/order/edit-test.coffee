`import { test, moduleFor } from 'ember-qunit'`

moduleFor 'controller:order/edit', 'OrderEditController', {
  # Specify the other units that are required for this test.
  # needs: ['controller:foo']
}

# Replace this with your real tests.
test 'it exists', ->
  controller = @subject()
  ok controller

# test '#isDeletable #isNotDeletable should be true/false if orderitems', ->
#   controller = @subject orderItems: [1, 2, 3]
#   equal controller.get('isDeletable'), yes, 'should be true'

# test '#isDeletable #isNotDeletable should be false/true if no orderitems', ->
#   controller = @subject orderItems: []
#   equal controller.get('isDeletable'), no, 'should be false'

