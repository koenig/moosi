`import Ember from 'ember'`
`import OrderTabActiveMixin from 'moosi/mixins/order-tab-active'`

module 'OrderTabActiveMixin'

# Replace this with your real tests.
test 'it works', ->
  OrderTabActiveObject = Ember.Object.extend OrderTabActiveMixin
  subject = OrderTabActiveObject.create()
  ok subject
