`import DS from 'ember-data'`

[attr, hasMany, belongsTo] = [DS.attr, DS.hasMany, DS.belongsTo]

Position = DS.Model.extend
  quantity: attr 'number', defaultValue: 0
  plant: belongsTo 'plant'
  quarter: belongsTo 'quarter' #, async: yes # this is probably not a good idea to change otherwise we have double positons in through plant model accessing quarter syncronous


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
