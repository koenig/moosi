`import Ember from 'ember'`
`import AccessActiveOrderMixin from 'moosi/mixins/access-active-order'`

module 'AccessActiveOrderMixin'

# Replace this with your real tests.
test 'it works', ->
  AccessActiveOrderObject = Ember.Object.extend AccessActiveOrderMixin
  subject = AccessActiveOrderObject.create()
  ok subject
