`import { test, moduleFor } from 'ember-qunit'`

moduleFor 'controller:plants/create', 'PlantsCreateController', {
  # Specify the other units that are required for this test.
  needs: ['controller:plant']
}

# Replace this with your real tests.
test 'it exists', ->
  controller = @subject()
  ok controller

