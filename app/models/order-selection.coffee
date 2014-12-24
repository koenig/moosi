`import DS from 'ember-data'`

attr = DS.attr
hasMany = DS.hasMany
belongsTo = DS.belongsTo

OrderSelection = DS.Model.extend
  from: belongsTo 'position'
  to: belongsTo 'orderItem'
  quantity: attr 'number'
  date: attr 'date', defaultValue: -> new Date()
  isRealTransaction: Em.computed 'from', 'to', ->
    @get('to') isnt @get('from')


`export default OrderSelection`
