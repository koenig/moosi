# Takes two parameters: container and app
`import Ember from 'ember'`

initialize = (container, app) ->
  getClassName = -> @toString().split(':')[1]
  app.register 'class:name', Em.computed( getClassName ), {instantiate: no}
  app.inject 'model', 'className', 'class:name'

  classNameIs = (name) -> @get('className') is name
  app.register 'class:nameIs', classNameIs, {instantiate: no}
  app.inject 'model', 'classNameIs', 'class:nameIs'

AddClassNameInitializer =
  name: 'add-class-name'
  initialize: initialize

`export {initialize}`
`export default AddClassNameInitializer`
