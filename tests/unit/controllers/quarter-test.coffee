`import { test, moduleFor } from 'ember-qunit'`

moduleFor 'controller:quarter', 'QuarterController',
  needs: ['controller:quarters']

# Replace this with your real tests.
test 'it exists', ->
  controller = @subject()
  ok controller

