`import Ember from 'ember'`

ClassNameMixin = Ember.Mixin.create
  className: Em.computed -> 
    result = @toString().split(':')[1]
    console.log result
    result
  classNameIs: (name) -> 
    console.log @get('className') , name
    @get('className') is name
    
`export default ClassNameMixin`
