`import DS from 'ember-data'`

[attr, hasMany, belongsTo] = [DS.attr, DS.hasMany, DS.belongsTo]

Order = DS.Model.extend
  number: attr 'string'
  customer: attr 'string'
  adress: attr 'string'
  date: attr 'date', defaultValue: -> new Date()

  orderItems: hasMany 'orderItem', async: true

  findOrderItemFor: (plant) ->
    orderItem = @get('orderItems').find (orderItem) -> orderItem.get('plant') is plant
    return orderItem if orderItem
    orderItem = @store.createRecord 'orderItem',
      order: @
      plant: plant
      quantity: 0
      plantName: plant.get('name')
      plantPriceInCents: plant.get('priceInCents')
    orderItem.save()
    orderItem
  totalInCents: Em.computed 'orderItems.@each.totalInCents', ->
    sum = 0
    @get('orderItems').forEach (orderItem) -> sum += orderItem.get('totalInCents') or 0
    sum
  totalPrice: Em.computed 'totalInCents', ->
    @get('totalInCents')/100

  name: Em.computed 'number', -> "Rechnung #{@get('number')}"

Order.reopenClass
  FIXTURES: [
    {
      id: 1
      number: '1'
      customer: 'Marko Liebknecht'
      adress: 'Tannenallee 23\n23443 Freiland'
      date: '2014-11-15'
      orderItems: [1, 2]

    }
    {
      id: 2
      number: '2'
      customer: 'Resi Laub'
      adress: 'Hammer Baum 23\n20243 Hamburg'
      date: '2014-12-02'
      orderItems: [3]
    }

  ]

`export default Order`
