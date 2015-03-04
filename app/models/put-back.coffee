`import DS from 'ember-data'`
`import className from '../mixins/class-name'`

[attr, hasMany, belongsTo] = [DS.attr, DS.hasMany, DS.belongsTo]

PutBack = DS.Model.extend className,
  from: belongsTo 'orderItem'
  to: belongsTo 'position'
  quantity: attr 'number'

  isRealTransaction: yes



`export default PutBack`
