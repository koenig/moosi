import Ember from 'ember';
import Resolver from 'ember/resolver';
import loadInitializers from 'ember/load-initializers';
import config from './config/environment';
import euro from './helpers/euro';
import date from './helpers/date';

Ember.MODEL_FACTORY_INJECTIONS = true;

var App = Ember.Application.extend({
  modulePrefix: config.modulePrefix,
  podModulePrefix: config.podModulePrefix,
  Resolver: Resolver,
  ready: function(){
    FastClick.attach(document.body);
    currency.settings.seperator = '.';
    currency.settings.decimal = ',';
  }
});

loadInitializers(App, config.modulePrefix);


Ember.Handlebars.registerBoundHelper('euro', euro);
Ember.Handlebars.registerBoundHelper('date', date);

export default App;
