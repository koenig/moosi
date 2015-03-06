`import { test, moduleFor } from 'ember-qunit'`

moduleFor 'controller:packing-lists/create', {
  # Specify the other units that are required for this test.
  needs: ['controller:packing-list']
}

# Replace this with your real tests.
test 'it exists', (assert) ->
  controller = @subject()
  assert.ok controller

