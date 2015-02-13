`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'order', 'Order',
  needs: 'model:order-item model:order-selection model:order model:plant model:position model:put-back model:quarter model:transaction'.w()



test 'it exists', ->
  model = @subject()
  # store = @store()
  ok !!model


test '#findOrderItemFor', ->
  expect 1
  Em.run =>
    store = @store()
    plant = store.createRecord 'plant'

    order = @subject()

    orderItem1 = order.findOrderItemFor plant
    orderItem2 = order.findOrderItemFor plant
    equal orderItem1.toString(), orderItem2.toString()
