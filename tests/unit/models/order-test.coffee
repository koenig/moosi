`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'order', 'Order',
  needs: 'model:order-item model:order-selection model:order model:plant model:position model:put-back model:quarter model:transaction'.w()



test 'it exists', ->
  model = @subject()
  ok !!model


test '#findOrderItemFor', ->
  expect 1
  Em.run =>
    store = @store()
    plant = store.createRecord 'plant'

    order = @subject()

    a = order.findOrderItemFor plant
    b = order.findOrderItemFor plant
    equal a, b


test '#totalInCents', ->
  expect 1
  Em.run =>
    store = @store()
    a = store.createRecord 'orderItem', plantPriceInCents: 200, quantity: 3
    b = store.createRecord 'orderItem', plantPriceInCents: 200, quantity: 2

    order = @subject()
    order.get('orderItems').pushObjects [a, b]

    equal order.get('totalInCents'), 1000


test '#totalPrice', ->
  expect 1
  Em.run =>
    store = @store()
    a = store.createRecord 'orderItem', plantPriceInCents: 200, quantity: 3
    b = store.createRecord 'orderItem', plantPriceInCents: 200, quantity: 2

    order = @subject()
    order.get('orderItems').pushObjects [a, b]

    equal order.get('totalPrice'), 10.00


test '#name', ->
  expect 1
  order = @subject number: 3

  equal order.get('name'), "Rechnung 3"

