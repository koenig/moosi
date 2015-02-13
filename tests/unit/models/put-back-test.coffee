`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'put-back', 'PutBack',
  needs: 'model:order-item model:order-selection model:order model:plant model:position model:put-back model:quarter model:transaction'.w()


test 'it exists', ->
  model = @subject()
  ok !!model


test '#isRealTransaction', ->
  expect 1
  model = @subject()

  equal model.get('isRealTransaction'), yes
