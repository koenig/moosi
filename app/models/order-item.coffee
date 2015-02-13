`import DS from 'ember-data'`
`import divideWithHundret from '../utils/divide-with-hundret'`

[attr, hasMany, belongsTo] = [DS.attr, DS.hasMany, DS.belongsTo]

OrderItem = DS.Model.extend
  order: belongsTo 'order'
  plant: belongsTo 'plant'
  plantName: attr 'string'
  plantPriceInCents: attr 'number'
  quantity: attr 'number'

  plantPrice: divideWithHundret 'plantPriceInCents'
  totalInCents: Em.computed 'plantPriceInCents', 'quantity', ->
    @get('plantPriceInCents') * @get('quantity')
  totalPrice: divideWithHundret 'totalInCents'

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
