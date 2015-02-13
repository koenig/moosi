`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'order-selection', 'OrderSelection',
  needs: 'model:order-item model:order-selection model:order model:plant model:position model:put-back model:quarter model:transaction'.w()



test 'it exists', ->
  model = @subject()
  ok !!model


test '#isRealTransaction', ->
  expect 1
  store = @store()
  Em.run =>
    position = store.createRecord 'position'
    orderItem = store.createRecord 'orderItem'

    model = @subject from: position, to: orderItem
    equal model.get('isRealTransaction'), yes
