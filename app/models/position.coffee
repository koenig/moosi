`import DS from 'ember-data'`

attr = DS.attr
hasMany = DS.hasMany
belongsTo = DS.belongsTo

Position = DS.Model.extend
  quantity: attr 'number'
  plant: belongsTo 'plant', async: yes
  quarter: belongsTo 'quarter', async: yes

Position.reopenClass
  FIXTURES: [
    {
      id: 1
      plant: 1
      quarter: 1
      quantity: 3
    }
    {
      id: 2
      plant: 1
      quarter: 2
      quantity: 5
    }
    {
      id: 3
      plant: 2
      quarter: 1
      quantity: 13
    }
    {
      id: 4
      plant: 2
      quarter: 2
      quantity: 5
    }

  ]

`export default Position`
