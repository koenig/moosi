`import Ember from 'ember'`

IndexRoute = Ember.Route.extend
  redirect: -> @transitionTo 'plants'

`export default IndexRoute`
