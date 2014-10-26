`import DS from 'ember-data'`
attr = DS.attr
hasMany = DS.hasMany
belongsTo = DS.belongsTo

Position = DS.Model.extend
  plant: belongsTo 'plant'


`export default Position`
