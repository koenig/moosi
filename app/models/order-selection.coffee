`import DS from 'ember-data'`

[attr, hasMany, belongsTo] = [DS.attr, DS.hasMany, DS.belongsTo]

OrderSelection = DS.Model.extend
  from: belongsTo 'position'
  to: belongsTo 'orderItem'
  quantity: attr 'number'

  isRealTransaction: yes


`export default OrderSelection`
