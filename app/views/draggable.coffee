`import Ember from 'ember'`

DraggableView = Ember.View.extend
  # touch gestures properties
  # startX: 0
  # dist: 0
  # active: null
  # maxDist: 250
  # threshold: 40
  # activeWidth: null
  classNames: 'main-content'
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
    $view = @$()

    # dragTrigger = '<div class="mobile-drag-trigger"><i class="icon-grip"></i></div>'
    # $(dragTrigger).appendTo($view)

    Em.run.later( =>
      @set 'shouldShow', yes
      # $view.css({ '-webkit-transform': 'translate3d(-100%, 0, 0)' })
    , 100)

  # touchStart: (event)->
  #   touchEvent = event.originalEvent.changedTouches[0]
  #   layer = $(touchEvent.target).closest('.mobile-drag-trigger')[0]
  #   if layer
  #     @active = $(layer).parents('.pane')[0]
  #     @onStart(event, touchEvent)
  #     @activeWidth = $(@active).outerWidth()

  # touchMove: (event)->
  #   event.preventDefault()
  #   return if !@active
  #   @onMove(event, event.originalEvent.changedTouches[0])

  # touchEnd: (event)->
  #   return if !@active
  #   @onEnd(event)

  # onStart: (e,d) ->
  #   e.stopPropagation()
  #   @startX = d.pageX
  #   @active.classList.add('drag')

  # onMove: (e,d) ->
  #   e.stopPropagation()
  #   @dist = (d.pageX - @startX) / 2

  #   # drag ⇚
  #   if @dist > 0
  #     @active.style.webkitTransform = 'translate3d(' + (-@activeWidth + @dist) + 'px, 0, 0)'
  #   # drag ⇛
  #   else
  #     @active.style.webkitTransform = 'translate3d(' + (-@activeWidth + @dist) + 'px, 0, 0)'

  # onEnd: (e) ->
  #   e.stopPropagation()
  #   @active.classList.remove('drag')

  #   # dragged ⇛
  #   if (@dist >= @threshold)
  #     @active.classList.remove('active')
  #     @goBackAfterTransition('collapsePanel')
  #   # dragged ⇚
  #   else
  #     @openPanel()

  #   @dist = 0
  #   @active = null

  # collapsePanel: ->
  #   @active.style.webkitTransform = 'translate3d(0%, 0, 0)'

  # openPanel: ->
  #   @active.style.webkitTransform = 'translate3d(-100%, 0, 0)'

  # goBackAfterTransition: (transitionType)->
  #   if (transitionType is 'collapsePanel' || !transitionType)

  #     @collapsePanel()

  #     Em.run.later(@, ->
  #       # there is no goBack method in the controller so it will bubble up to routes
  #       # until it finds the goBack event located in the ApplicationRoute
  #       @get('controller').send('goBack')
  #     , 600)




  # actions:
  #   closeUserWithTransition: ->
  #     @$().find('.pane').css({ '-webkit-transform': 'translate3d(0%, 0, 0)' })

  #     Em.run.later(@, ->
  #       @get('controller').send('goBack')
  #     , 600)


  #   saveWithTransition: ->
  #     controller = @get('controller')

  #     @$().find('.pane').css({ '-webkit-transform': 'translate3d(0%, 0, 0)' })

  #     Em.run.later(@, ->
  #       controller.send('save')
  #       controller.send('goBack')
  #     , 600)



`export default DraggableView`
