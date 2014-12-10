`import DS from 'ember-data'`
attr = DS.attr
hasMany = DS.hasMany
belongsTo = DS.belongsTo

Transaction = DS.Model.extend
  from: belongsTo 'position'
  to: belongsTo 'position'
  quantity: attr 'number'
  date: attr 'date', defaultValue: -> new Date()

`export default Transaction`
