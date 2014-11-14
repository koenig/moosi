`import Ember from 'ember'`

ActionSheetComponent = Ember.Component.extend
  isVisible: no

  actions:
    hideSheet: ->
      console.log 'no no no'
      @set 'isVisible', no
    goToQuarters: ->
      console.log 'goto'
      @sendAction 'goToQuarters'

`export default ActionSheetComponent`
