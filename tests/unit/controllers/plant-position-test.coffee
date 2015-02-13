`import { test, moduleFor } from 'ember-qunit'`

moduleFor 'controller:plant-position', 'PlantPositionController',
  needs: ['controller:transaction']



# Replace this with your real tests.
test 'it exists', ->
  controller = @subject()
  ok controller

