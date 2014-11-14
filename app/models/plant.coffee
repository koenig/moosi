`import DS from 'ember-data'`
attr = DS.attr
hasMany = DS.hasMany
belongsTo = DS.belongsTo

Plant = DS.Model.extend
  name: attr()
  price: attr 'number'
  positions: hasMany 'position'



Plant.reopenClass
  FIXTURES: [
    {
      id: 1
      name: 'anc'
      price: 2.40
      positions: []
    }
    {
      id: 2
      name: 'all'
      price: 3.20
      positions: []
    }
  ]
`export default Plant`
