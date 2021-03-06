import Ember from 'ember';
import Resolver from 'ember/resolver';
import loadInitializers from 'ember/load-initializers';
import config from './config/environment';
import { euro } from './helpers/euro';
import { date } from './helpers/date';
import { bool } from './helpers/bool';

Ember.MODEL_FACTORY_INJECTIONS = true;

var App = Ember.Application.extend({
  modulePrefix: config.modulePrefix,
  podModulePrefix: config.podModulePrefix,
  Resolver: Resolver,
  ready: function(){
    FastClick.attach(document.body);
    currency.settings.seperator = '.';
    currency.settings.decimal = ',';
    // stop bouncy ui
    document.addEventListener('touchmove', function(e) {
      if (!$(e.target).parents('.content')[0]) {
        e.preventDefault();
      }
    }, false);
  }
});

loadInitializers(App, config.modulePrefix);


Ember.Handlebars.registerBoundHelper('euro', euro);
Ember.Handlebars.registerBoundHelper('date', date);
Ember.Handlebars.registerBoundHelper('bool', bool);

export default App;
