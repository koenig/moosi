`import DS from 'ember-data'`
attr = DS.attr
hasMany = DS.hasMany
belongsTo = DS.belongsTo

Position = DS.Model.extend
  quantity: attr 'number'
  plant: belongsTo 'plant'
  quarter: belongsTo 'quarter'

Position.reopenClass
  FIXTURES: []

`export default Position`
