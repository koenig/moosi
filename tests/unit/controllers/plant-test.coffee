`import { test, moduleFor } from 'ember-qunit'`

moduleFor 'controller:plant', 'PlantController',
  needs: ['controller:transaction', 'controller:application']

# Replace this with your real tests.
test 'it exists', ->
  controller = @subject()
  ok controller

