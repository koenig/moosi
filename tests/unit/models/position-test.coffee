`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'position', 'Position',
  needs: 'model:order-item model:order-selection model:order model:plant model:position model:put-back model:quarter model:transaction'.w()


test 'it exists', ->
  model = @subject()
  ok !!model


test '#isPlant', ->
  expect 2
  store = @store()
  Em.run =>
    quarter = store.createRecord 'quarter'
    model = @subject quarter: quarter

    equal model.get('isPlant'), quarter.get('isPlant')
    equal model.get('isYoung'), quarter.get('isYoung')
