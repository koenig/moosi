# Takes two parameters: container and app
initialize = (container, app) ->
  app.register 'active:tab', yes, instantiate: no

  createResource = (name) ->
    app.inject "controller:#{name}", "#{name}TabActive", "active:tab"
    app.inject "controller:#{name}/edit", "#{name}TabActive", "active:tab"
    app.inject "controller:#{name}s", "#{name}TabActive", "active:tab"
    app.inject "controller:#{name}s/create", "#{name}TabActive", "active:tab"

  createResource 'order'
  createResource 'plant'
  createResource 'packing-list'



  # app.register 'route', 'foo', 'service:foo'

ActiveTabInitializer =
  name: 'active-tab'
  initialize: initialize

`export {initialize}`
`export default ActiveTabInitializer`
