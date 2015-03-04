`import Ember from 'ember'`
`import ClassNameMixin from '../../../mixins/class-name'`
`import { module, test } from 'qunit'`

module 'ClassNameMixin'

# Replace this with your real tests.
test 'it works', (assert) ->
  ClassNameObject = Ember.Object.extend ClassNameMixin
  subject = ClassNameObject.create()
  assert.ok subject
