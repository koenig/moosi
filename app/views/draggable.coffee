`import Ember from 'ember'`

DraggableView = Ember.View.extend
  classNames: ['main-content', 'flexbox']
  classNameBindings: ['shouldShow:in']
  tagName: 'div'
  shouldShow: no
  actions:
    back: ->
      @set 'shouldShow', no
      Em.run.later(@, =>
        @get('controller').send 'goBack'
      , 400)


  didInsertElement: ->
    Em.run.later( =>
      @set 'shouldShow', yes
    , 100)


`export default DraggableView`
