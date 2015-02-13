`import DS from 'ember-data'`

[attr, hasMany, belongsTo] = [DS.attr, DS.hasMany, DS.belongsTo]

Plant = DS.Model.extend
  init: ->
    @_super()

    @store.find('quarter').then (quarters) =>
      quarters.forEach (quarter) =>
        foundQuarter = @get('positions').find (position) ->
          position.get('quarter') is quarter
        unless foundQuarter
          @createNewPosition quarter


  name: attr()
  priceInCents: attr 'number', defaultValue: 0
  price: Em.computed 'priceInCents', ->
    currency(@get('priceInCents')/100).format()

  positions: hasMany 'position'
  orderItems: hasMany 'orderItem'

  youngPlantQuantity: Em.computed 'positions.@each.quantity', ->
    @get('positions.firstObject.quantity')

  quantity: Em.computed 'positions.@each.quantity', ->
    result = 0
    @get('positions').forEach (position) =>
      return if position is @get('positions.firstObject')
      result += position.getWithDefault('quantity', 0)
    result

  createNewPosition: (quarter) ->
    @store.createRecord 'position',
      quarter: quarter
      plant: @

Plant.reopenClass
  FIXTURES: [
    {
      id: 1
      name: 'anc'
      priceInCents: 240
      positions: [1, 2]
      orderItems: [1, 3]
    }
    {
      id: 2
      name: 'all'
      priceInCents: 320
      positions: [3, 4]
      orderItems: [2]
    }
  ]
`export default Plant`
