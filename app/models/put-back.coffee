`import DS from 'ember-data'`

[attr, hasMany, belongsTo] = [DS.attr, DS.hasMany, DS.belongsTo]

PutBack = DS.Model.extend
  from: belongsTo 'orderItem'
  to: belongsTo 'position'
  quantity: attr 'number'

  isRealTransaction: Em.computed 'from', 'to', ->
    @get('to') isnt @get('from')



`export default PutBack`
