`import DS from 'ember-data'`
attr = DS.attr
hasMany = DS.hasMany
belongsTo = DS.belongsTo

Plant = DS.Model.extend
  init: ->
    @_super()

    @store.find('quarter').then (quarters) =>
      quarters.forEach (quarter) =>
        @get('positions').then (positions) =>
          foundQuarter = positions.find (position) -> position.get('quarter') is quarter
          unless foundQuarter
            @createNewPosition quarter


  name: attr()
  price: attr 'number', defaultValue: 0
  positions: hasMany 'position', async: yes
  youngPlantQuantity: Em.computed 'positions.@each.quantity', ->
    @get('positions.firstObject.quantity')
  orderItems: hasMany 'orderItem', async: true


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
      price: 2.40
      positions: [1, 2]
      orderItems: [1, 3]
    }
    {
      id: 2
      name: 'all'
      price: 3.20
      positions: [3, 4]
      orderItems: [2]
    }
  ]
`export default Plant`
