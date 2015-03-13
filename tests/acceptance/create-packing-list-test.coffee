`import Ember from 'ember'`
`import { module, test } from 'qunit'`
`import startApp from '../helpers/start-app'`

application = null

module 'Acceptance: CreatePackingList',
  beforeEach: ->
    application = startApp()
    ###
    Don't return as Ember.Application.then is deprecated.
    Newer version of QUnit uses the return value's .then
    function to wait for promises if it exists.
    ###
    return

  afterEach: ->
    Ember.run application, 'destroy'

test 'create a packing list', () ->
  visit '/packing-lists/create'

  andThen ->
    equal currentPath(), 'packing-lists.create'

  fillIn 'div.item.item-input', 'abc'
  click 'button.blue'

  andThen ->
    equal currentPath(), 'packing-lists.packing-list.index'
    equal currentRouteName(), 'packing-list.index'
    # equal find('div div.header .title').text(), 'abc'
