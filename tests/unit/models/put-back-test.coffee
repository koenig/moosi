`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'put-back', 'PutBack',
  needs: 'model:order-item model:order-selection model:order model:plant model:position model:put-back model:quarter model:transaction'.w()


test 'it exists', ->
  model = @subject()
  # store = @store()
  ok !!model
