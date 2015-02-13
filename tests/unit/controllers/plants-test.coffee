`import { test, moduleFor } from 'ember-qunit'`

moduleFor 'controller:plants', 'PlantsController', {
  # Specify the other units that are required for this test.
  needs: ['controller:application']
}

# Replace this with your real tests.
test 'it exists', ->
  controller = @subject()
  ok controller

