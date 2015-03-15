# Takes two parameters: container and app
initialize = (container, app) ->
  updateStateTo = (transition, name, state) ->
    if name.substring(0, 5) is transition.targetName.substring(0, 5)
      transition.send 'setState', name, state
  app.register 'update:state', updateStateTo, instantiate: no
  app.inject 'route:packing-list', 'updateStateTo', 'update:state'
  app.inject 'route:order', 'updateStateTo', 'update:state'
  app.inject 'route:plant', 'updateStateTo', 'update:state'
UpdateStateInitializer =
  name: 'update-state'
  initialize: initialize

`export {initialize}`
`export default UpdateStateInitializer`
