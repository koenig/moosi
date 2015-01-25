`import Ember from 'ember'`

ActionSheetComponent = Ember.Component.extend
  isVisible: no

  actions:
    hideSheet: ->
      @set 'isVisible', no
    goToQuarters: ->
      @sendAction 'goToQuarters'
    goToImport: ->
      @sendAction 'goToImport'

`export default ActionSheetComponent`
