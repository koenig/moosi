`import Ember from 'ember'`
`import config from './config/environment'`

Router = Ember.Router.extend
  location: config.locationType

Router.map ->
  @resource 'plants', ->
    @resource 'plant', path: '/:plant_id', ->
      @route 'edit'
    @route 'create'
    @resource 'analytics'
    @resource 'quarters'
    @route 'import'
  @resource 'orders', ->
    @resource 'order', path: '/:order_id', ->
      @route 'edit'
    @route 'create'
  @resource 'packing-lists', ->
    @resource 'packing-list', path: '/:packing_list_id', ->
      @route 'edit'
    @route 'create'

  # @route 'loading'

`export default Router`
