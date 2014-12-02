`import DS from 'ember-data'`
attr = DS.attr
hasMany = DS.hasMany
belongsTo = DS.belongsTo

Quarter = DS.Model.extend
  name: attr()
  positions: hasMany 'position'
  copy: ->
    {name: @get('name')}


Quarter.reopenClass
  FIXTURES: [
    {
      id: 1
      name: 'Hauptlager'
    }
    {
      id: 2
      name: 'Nebenlager'
    }
  ]


`export default Quarter`
