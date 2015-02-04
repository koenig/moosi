`import DS from 'ember-data'`

[attr, hasMany, belongsTo] = [DS.attr, DS.hasMany, DS.belongsTo]

Quarter = DS.Model.extend
  name: attr()
  positions: hasMany 'position'


Quarter.reopenClass
  FIXTURES: [
    {
      id: 1
      name: 'Jungpflanzen'
    }
    {
      id: 2
      name: 'Hauptlager'
    }
  ]


`export default Quarter`
