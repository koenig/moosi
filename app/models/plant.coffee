`import DS from 'ember-data'`
attr = DS.attr
hasMany = DS.hasMany
belongsTo = DS.belongsTo

Plant = DS.Model.extend
  name: attr()
  price: attr('number')
  # positions: hasMany('position')
  # quarters: DS.hasMany 'quarter'

Plant.reopenClass
  FIXTURES: [
    {
      id: 1
      name: 'anc'
    }
    {
      id: 2
      name: 'all'
    }
  ]
`export default Plant`
