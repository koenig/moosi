`import Ember from 'ember'`
`import config from './config/environment'`

Router = Ember.Router.extend
  location: config.locationType

Router.map ->
  @resource 'plants', ->
    @resource 'plant', path: '/:plant_id', ->
      @route 'edit'
    @route 'create'
    @resource 'quarters'
    @route 'import'
  @resource 'orders', ->
    @resource 'order', path: '/:order_id', ->
      @route 'edit'
    @route 'create'


`export default Router`
