`import DS from 'ember-data'`
`import divideWithHundret from '../utils/divide-with-hundret'`

[attr, hasMany, belongsTo] = [DS.attr, DS.hasMany, DS.belongsTo]

OrderItem = DS.Model.extend
  order: belongsTo 'order'
  plant: belongsTo 'plant'
  plantName: attr 'string'
  plantPriceInCents: attr 'number', defaultValue: 0
  quantity: attr 'number', defaultValue: 0
  done: attr 'boolean', defaultValue: false

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
      plantName: 'Narzisse'
      plantPriceInCents: 200
    }
    {
      id: 2
      order: 1
      plant: 2
      quantity: 3
      plantName: 'Rose'
      plantPriceInCents: 320
    }
    {
      id: 3
      order: 2
      plant: 1
      quantity: 6
      plantName: 'Tulpe'
      plantPriceInCents: 120
    }
    {
      id: 4
      order: 3
      plant: 1
      quantity: 12
      plantName: 'Glücksfeder'
      plantPriceInCents: 2200
    }
    {
      id: 5
      order: 3
      plant: 2
      quantity: 3
      plantName: 'Elefantenfuss'
      plantPriceInCents: 1900
    }
  ]


`export default OrderItem`
