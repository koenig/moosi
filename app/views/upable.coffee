`import Ember from 'ember'`

UpableView = Ember.View.extend
  classNames: 'down-content'
  classNameBindings: ['shouldShow:in']
  tagName: 'div'
  shouldShow: no
  actions:
    back: ->
      @set 'shouldShow', no
      Em.run.later( =>
        @get('controller').send 'goBack'
      , 400)

  didInsertElement: ->
    $view = @$()
    Em.run.later( =>
      @set 'shouldShow', yes
    , 0)

`export default UpableView`
