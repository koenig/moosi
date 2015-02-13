`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'quarter', 'Quarter',
  needs: 'model:order-item model:order-selection model:order model:plant model:position model:put-back model:quarter model:transaction'.w()

test 'it exists', ->
  model = @subject()
  ok !!model


test '#isPlant', ->
  expect 2
  Em.run =>
    model = @subject isYoung: yes

    equal model.get('isPlant'), no

    model.set 'isYoung', no
    equal model.get('isPlant'), yes
