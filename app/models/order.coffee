`import DS from 'ember-data'`
attr = DS.attr
hasMany = DS.hasMany
belongsTo = DS.belongsTo

Order = DS.Model.extend
  name: attr 'string'
  customer: attr 'string'
  adress: attr 'string'
  date: attr 'date'
  orderItems: hasMany 'orderItem'
  findOrderItemFor: (plant) ->
    orderItem = @get('orderItems').find (orderItem) -> orderItem.get('plant') is plant
    return orderItem if orderItem
    orderItem = @store.createRecord 'orderItem',
      order: @
      plant: plant
      quantity: 0
    orderItem.save()
    orderItem

Order.reopenClass
  FIXTURES: [
    {
      id: 1
      name: "Reschnung Nr.1"
      customer: 'Marko Liebknecht'
      adress: 'Tannenallee 23
      23443 Freiland'
      date: '2014-11-15'

    }
    {
      id: 2
      name: "Reschnung Nr.2"
      customer: 'Resi Laub'
      adress: 'Hammer Baum 23
      20243 Hamburg'
      date: '2014-12-02'
    }

  ]

`export default Order`
