`import { test, moduleFor } from 'ember-qunit'`

moduleFor 'controller:position', 'PositionController',
  needs: ['controller:transaction', 'controller:application']


# Replace this with your real tests.
test 'it exists', ->
  controller = @subject()
  ok controller

