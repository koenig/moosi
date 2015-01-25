`import Ember from 'ember'`

TabsView = Ember.View.extend
  templateName: 'tabs'
  orderTabStyle: Em.computed 'controller.orderTabActive', ->
    return 'tab-item aktiv' if @get 'controller.orderTabActive'
    'tab-item'
  plantTabStyle: Em.computed 'controller.orderTabActi', ->
    return 'tab-item aktiv' unless @get 'controller.orderTabActive'
    'tab-item'
`export default TabsView`
