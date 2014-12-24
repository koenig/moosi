`import Ember from 'ember'`

AccessActiveOrderMixin = Ember.Mixin.create
  needs: ['application']
  activeOrder: Em.computed.alias 'controllers.application.activeOrder'
  hasActiveOrder: Em.computed.bool 'activeOrder'


`export default AccessActiveOrderMixin`
