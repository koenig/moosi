`import DS from 'ember-data'`

[attr, hasMany, belongsTo] = [DS.attr, DS.hasMany, DS.belongsTo]

Order = DS.Model.extend
  number: attr 'string'
  customer: attr 'string'
  adress: attr 'string'
  date: attr 'date', defaultValue: -> new Date()
  isPackingList: attr 'boolean', defaultValue: false
  isOrder: Em.computed.not 'isPackingList'

  orderItems: hasMany 'orderItem'

  findOrderItemFor: (plant) ->
    orderItem = @get('orderItems').find (orderItem) ->
      orderItem.get('plant') is plant
    return orderItem if orderItem
    orderItem = @store.createRecord 'orderItem',
      order: @
      plant: plant
      quantity: 0
      plantName: plant.get('name')
      plantPriceInCents: plant.get('priceInCents')

    orderItem

  typeName: Em.computed 'isPackingList', ->
    return 'packing-list' if @get 'isPackingList'
    'order'
  totalInCentsValues: Em.computed.mapBy 'orderItems', 'totalInCents'
  totalInCents: Em.computed.sum 'totalInCentsValues'
  totalPrice: Em.computed 'totalInCents', -> @get('totalInCents')/100
  name: Em.computed 'number', 'customer', 'isPackingList', ->
    return @get('customer') if @get('isPackingList')
    "Rechnung #{@get('number')}"

Order.reopenClass
  FIXTURES: [
    {
      id: 1
      number: '1'
      customer: 'Marko Liebknecht'
      adress: 'Tannenallee 23\n23443 Freiland'
      date: '2014-11-15'
      orderItems: [1, 2]
      isPackingList: no
    }
    {
      id: 2
      number: '2'
      customer: 'Resi Laub'
      adress: 'Hammer Baum 23\n20243 Hamburg'
      date: '2014-12-02'
      orderItems: [3]
      isPackingList: no
    }
    {
      id: 3
      number: null
      customer: 'Höwer Markt'
      date: '2014-12-22'
      orderItems: [4, 5]
      isPackingList: yes
    }


  ]

`export default Order`
