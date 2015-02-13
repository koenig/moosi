`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'order-item', 'OrderItem',
  needs: 'model:order-item model:order-selection model:order model:plant model:position model:put-back model:quarter model:transaction'.w()



test 'it exists', ->
  model = @subject()
  # store = @store()
  ok !!model


test 'it calulates plantPrice', ->
  expect 1
  model = @subject plantPriceInCents: 300

  equal model.get('plantPrice'), 3.00


test 'it calulates totalInCents', ->
  expect 1
  model = @subject plantPriceInCents: 300, quantity: 2

  equal model.get('totalInCents'), 600


test 'it calulates totalPrice', ->
  expect 1
  model = @subject plantPriceInCents: 300, quantity: 2

  equal model.get('totalPrice'), 6.00
