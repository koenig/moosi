`import DS from 'ember-data'`
attr = DS.attr
hasMany = DS.hasMany
belongsTo = DS.belongsTo

OrderItem = DS.Model.extend
  order: belongsTo 'order'
  plant: belongsTo 'plant'
  quantity: attr 'number'

`export default OrderItem`
