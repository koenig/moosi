`import DS from 'ember-data'`
`import divideWithHundret from '../utils/divide-with-hundret'`

[attr, hasMany, belongsTo] = [DS.attr, DS.hasMany, DS.belongsTo]

Plant = DS.Model.extend
  # this is to check if a plant has all positions availsable
  # doThis: (->
  #   console.log 'didcreate', @get('isNew'), @get('justCreated')
  #   if @get('justCreated')
  #     @store.all('quarter').forEach (quarter) =>
  #       foundQuarter = @get('positions').find (position) ->
  #         position.get('quarter') is quarter
  #       return if foundQuarter
  #       @createNewPosition quarter
  # ).on 'init'
  onInit: (-> @get('searchName')).observes('name').on('init')

  name: attr 'string', defaultValue: ''
  propagated: attr 'boolean', defaultValue: false
  labelled: attr 'boolean', defaultValue: false
  priceInCents: attr 'number', defaultValue: 0
  price: divideWithHundret 'priceInCents'
  searchName: Em.computed 'name', -> @get('name').toLowerCase()
  # search
  hideOnPlantsList: no

  positions: hasMany 'position'
  orderItems: hasMany 'orderItem'

  youngPlantPositions: Em.computed.filterBy 'positions', 'isYoung'
  youngPlantsquantityValues: Em.computed.mapBy 'youngPlantPositions', 'quantity'
  youngPlantQuantity: Em.computed.sum 'youngPlantsquantityValues'

  plantPositions: Em.computed.filterBy 'positions', 'isPlant'
  quantityValues: Em.computed.mapBy 'plantPositions', 'quantity'
  quantity: Em.computed.sum 'quantityValues'

  createNewPosition: (quarter) ->
    position = @store.createRecord 'position',
      quarter: quarter
      plant: @
    # Em.run.later => position.save()
    position


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
