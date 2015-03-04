`import DS from 'ember-data'`
`import className from '../mixins/class-name'`

[attr, hasMany, belongsTo] = [DS.attr, DS.hasMany, DS.belongsTo]

OrderSelection = DS.Model.extend className,
  from: belongsTo 'position'
  to: belongsTo 'orderItem'
  quantity: attr 'number'

  isRealTransaction: yes


`export default OrderSelection`
