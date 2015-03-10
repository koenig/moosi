`import DS from 'ember-data'`
`import divideWithHundret from '../utils/divide-with-hundret'`

[attr, hasMany, belongsTo] = [DS.attr, DS.hasMany, DS.belongsTo]

Plant = DS.Model.extend
  doThis: (->
    @store.find('quarter').then (quarters) =>
      quarters.forEach (quarter) =>
        foundQuarter = @get('positions').find (position) ->
          position.get('quarter') is quarter
        unless foundQuarter
          @createNewPosition quarter
  ).on 'init'

  name: attr 'string'
  propagated: attr 'boolean', defaultValue: false
  labelled: attr 'boolean', defaultValue: false
  priceInCents: attr 'number', defaultValue: 0
  price: divideWithHundret 'priceInCents'

  positions: hasMany 'position'
  orderItems: hasMany 'orderItem'

  youngPlantPositions: Em.computed.filterBy 'positions', 'isYoung'
  youngPlantsquantityValues: Em.computed.mapBy 'youngPlantPositions', 'quantity'
  youngPlantQuantity: Em.computed.sum 'youngPlantsquantityValues'

  plantPositions: Em.computed.filterBy 'positions', 'isPlant'
  quantityValues: Em.computed.mapBy 'plantPositions', 'quantity'
  quantity: Em.computed.sum 'quantityValues'

  createNewPosition: (quarter) ->
    quarter = @store.createRecord 'position',
      quarter: quarter
      plant: @
    Em.run.later => quarter.save()
    quarter

Plant.reopenClass
  FIXTURES: [
    {
      id: 1
      name: "Agastache rugosa 'After Eight'"
      priceInCents: 240
      positions: [1, 2]
      orderItems: [1, 3]
      labelled: yes
      propagated: no
    }
    {
      id: 2
      name: "Echinacea purpurea 'Baby Swan White'"
      priceInCents: 320
      positions: [3, 4]
      orderItems: [2]
      labelled: no
      propagated: yes
    }
  ]
`export default Plant`
