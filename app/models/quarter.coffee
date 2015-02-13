`import DS from 'ember-data'`

[attr, hasMany, belongsTo] = [DS.attr, DS.hasMany, DS.belongsTo]

Quarter = DS.Model.extend
  name: attr 'string'
  isYoung: attr 'boolean', defaultValue: false
  positions: hasMany 'position'

  isPlant: Em.computed.not 'isYoung'

Quarter.reopenClass
  FIXTURES: [
    {
      id: 1
      name: 'Jungpflanzen'
      isYoung: yes
    }
    {
      id: 2
      name: 'Hauptlager'
      isYoung: no
    }
  ]


`export default Quarter`
