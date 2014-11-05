`import Ember from 'ember'`

DragAbleComponent = Ember.Component.extend()
  classNames: 'main-content'
  classNameBindings: ['shouldShow:in']
  tagName: 'div'
  shouldShow: no
  action:
    back: -> console.log 'ab'

  didInsertElement: ->
    Em.run.later( =>
      console.log 'j'
      @set 'shouldShow', yes
    , 100)

`export default DragAbleComponent`
