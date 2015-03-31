`import { test, moduleFor } from 'ember-qunit'`

moduleFor 'controller:plants', 'PlantsController',
  needs: ['controller:application']


# Replace this with your real tests.
test 'it exists', ->
  controller = @subject()
  ok controller

# test '@search', ->
#   controller = @subject
#     model: [
#       Em.Object.create searchName: 'Glücksfeder'
#       Em.Object.create searchName: 'Pfauen-Feder'
#       Em.Object.create searchName: 'Apfel'
#       Em.Object.create searchName: 'banane'
#       Em.Object.create searchName: 'Pflaume'
#     ]
#   controller.set 'searchString', 'fEdEr '
#   equal controller.get('arrangedContent.length'), 5, 'should be five'
#   # equal controller.get('arrangedContent').getEach('hideOnPlantsList').get('length'), 5
#   equal controller.get('arrangedContent').getEach('hideOnPlantsList').filter((ab) -> ab).length, 2, 'should be two'

