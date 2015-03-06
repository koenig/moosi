`import Ember from 'ember'`

ActionSheetComponent = Ember.Component.extend
  isVisible: no

  actions:
    hideSheet: ->
      @set 'isVisible', no
    goTo: (where) ->
      console.log 'go1', where
      @sendAction "goTo", where

`export default ActionSheetComponent`
