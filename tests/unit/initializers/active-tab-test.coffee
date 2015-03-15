`import Ember from 'ember'`
`import { initialize } from '../../../initializers/active-tab'`
`import { module, test } from 'qunit'`

container = null
application = null

module 'ActiveTabInitializer',
  beforeEach: ->
    Ember.run ->
      application = Ember.Application.create()
      container = application.__container__
      application.deferReadiness()

# Replace this with your real tests.
test 'it works', (assert) ->
  initialize container, application

  # you would normally confirm the results of the initializer here
  # TODO get model:order and create -> check if className == order
  assert.ok true
