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
            console.log 'no position found creating'
            @createNewPosition quarter


  name: attr()
  price: attr 'number'
  positions: hasMany 'position', async: yes

  quantity: Em.computed 'positions.@each.quantity', ->
    result = 0
    @get('positions').forEach (position) ->
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
    }
    {
      id: 2
      name: 'all'
      price: 3.20
      positions: [3, 4]
    }
  ]
`export default Plant`
