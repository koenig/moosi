`import DS from 'ember-data'`
`import className from '../mixins/class-name'`

[attr, hasMany, belongsTo] = [DS.attr, DS.hasMany, DS.belongsTo]


Transaction = DS.Model.extend className, 
  from: belongsTo 'position'
  to: belongsTo 'position'
  quantity: attr 'number'

  isRealTransaction: Em.computed 'from', 'to', ->
    @get('to') isnt @get('from')
`export default Transaction`
