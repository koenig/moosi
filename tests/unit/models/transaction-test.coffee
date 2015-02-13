`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'transaction', 'Transaction',
  needs: 'model:order-item model:order-selection model:order model:plant model:position model:put-back model:quarter model:transaction'.w()



test 'it exists', ->
  model = @subject()
  ok !!model


test '#isRealTransaction', ->
  expect 2
  store = @store()
  Em.run =>
    a = store.createRecord('position')
    b = store.createRecord('position')

    model = @subject from: a, to: a

    equal model.get('isRealTransaction'), no

    model.set 'to', b
    equal model.get('isRealTransaction'), yes
