# Takes two parameters: container and app
initialize = (container, app) ->
  app.register 'bool:yes', yes, instantiate: no

  createResource = (name) ->
    camelName = name.camelize()
    app.inject "controller:#{camelName}", "#{camelName}TabActive", "bool:yes"
    app.inject "controller:#{camelName}/edit", "#{camelName}TabActive", "bool:yes"
    app.inject "controller:#{camelName}s", "#{camelName}TabActive", "bool:yes"
    app.inject "controller:#{camelName}s/create", "#{camelName}TabActive", "bool:yes"

  createResource 'order'
  createResource 'plant'
  createResource 'packing-list'



  # app.register 'route', 'foo', 'service:foo'

ActiveTabInitializer =
  name: 'active-tab'
  initialize: initialize

`export {initialize}`
`export default ActiveTabInitializer`
