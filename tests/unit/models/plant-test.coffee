`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'plant', 'Plant',
  needs: 'model:order-item model:order-selection model:order model:plant model:position model:put-back model:quarter model:transaction'.w()



test 'it exists', ->
  model = @subject()
  # store = @store()
  ok !!model


test '#price', ->
  expect 1
  plant = @subject priceInCents: 200

  equal plant.get('price'), 2.00


test '#youngPlantQuantity', ->
  expect 1
  Em.run =>
    store = @store()
    young = store.createRecord 'quarter', isYoung: yes
    old = store.createRecord 'quarter'

    young_p = store.createRecord 'position',
      quarter: young
      quantity: 3
    old_p = store.createRecord 'position',
      quarter: old
      quantity: 5

    plant = @subject()
    plant.get('positions').pushObjects [young_p, old_p]

    equal plant.get('youngPlantQuantity'), 3


test '#quantity', ->
  expect 1
  Em.run =>
    store = @store()
    young = store.createRecord 'quarter', isYoung: yes
    old = store.createRecord 'quarter'
    third = store.createRecord 'quarter'

    young_p = store.createRecord 'position',
      quarter: young
      quantity: 3
    old_p = store.createRecord 'position',
      quarter: old
      quantity: 5
    third_p = store.createRecord 'position',
      quarter: old
      quantity: 5

    plant = @subject()
    plant.get('positions').pushObjects [young_p, old_p, third_p]

    equal plant.get('quantity'), 10



test '#createNewPosition', ->
  expect 2
  Em.run =>
    store = @store()

    quarter = store.createRecord 'quarter'
    plant = @subject()

    position = plant.createNewPosition(quarter)

    equal position.get('plant'), plant
    equal position.get('quarter'), quarter


test '#init', ->
  expect 1
  Em.run =>
    store = @store()

    quarters = store.find('quarter')
    plant = @subject()

    equal plant.get('positions.length'), quarters.get('length')

