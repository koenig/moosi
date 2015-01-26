`import DS from 'ember-data'`
attr = DS.attr
hasMany = DS.hasMany
belongsTo = DS.belongsTo

OrderItem = DS.Model.extend
  order: belongsTo 'order', async: yes
  plant: belongsTo 'plant', async: yes
  plantName: attr 'string'
  quantity: attr 'number'

  total: Em.computed 'plant.price', 'quantity', ->
    @get('plant.price') * @get('quantity')

OrderItem.reopenClass
  FIXTURES: [
    {
      id: 1
      order: 1
      plant: 1
      quantity: 12
    }
    {
      id: 2
      order: 1
      plant: 2
      quantity: 3
    }
    {
      id: 3
      order: 2
      plant: 1
      quantity: 6
    }
  ]


`export default OrderItem`
