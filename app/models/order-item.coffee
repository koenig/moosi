`import DS from 'ember-data'`
attr = DS.attr
hasMany = DS.hasMany
belongsTo = DS.belongsTo

OrderItem = DS.Model.extend
  order: belongsTo 'order', async: yes
  plant: belongsTo 'plant', async: yes
  plantName: attr 'string'
  plantPriceInCents: attr 'number'
  quantity: attr 'number'

  plantPrice: Em.computed 'plantPriceInCents', ->
    @get('plantPriceInCents')/100
  totalInCents: Em.computed 'plant.priceInCents', 'quantity', ->
    @get('plantPriceInCents') * @get('quantity')
  totalPrice: Em.computed 'totalInCents', ->
    @get('totalInCents')/100

OrderItem.reopenClass
  FIXTURES: [
    {
      id: 1
      order: 1
      plant: 1
      quantity: 12
      plantName: 'Tulpe'
      plantPriceInCents: 200
    }
    {
      id: 2
      order: 1
      plant: 2
      quantity: 3
      plantName: 'Tulpe'
      plantPriceInCents: 200
    }
    {
      id: 3
      order: 2
      plant: 1
      quantity: 6
      plantName: 'Tulpe'
      plantPriceInCents: 200
    }
  ]


`export default OrderItem`
