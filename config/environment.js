/* jshint node: true */

module.exports = function(environment) {
  var ENV = {
    modulePrefix: 'moosi',
    environment: environment,
    baseURL: '/',
    locationType: 'auto',
    EmberENV: {
      FEATURES: {
        // Here you can enable experimental features on an ember canary build
        // e.g. 'with-controller': true
      }
    },

    APP: {
      // Here you can pass flags/options to your application instance
      // when it is created
    }
  };

  ENV.manifest = {
    enabled: true,
    excludePaths: ['robots.txt', 'crossdomain.xml', 'index.html', 'testem.js', 'tests/index.html', 'assets/hidden/'],
    showCreateDate: false,
  }
  
  // setup backend URL
  ENV.host = process.env.BACKEND_URL || 'http://0.0.0.0:3000';

  if (environment === 'development') {
    // ENV.APP.LOG_RESOLVER = true;
    // ENV.APP.LOG_ACTIVE_GENERATION = true;
    // ENV.APP.LOG_TRANSITIONS = true;
    // ENV.APP.LOG_TRANSITIONS_INTERNAL = true;
    // ENV.APP.LOG_VIEW_LOOKUPS = true;
    ENV.contentSecurityPolicy = {
      'default-src': "'none'",
      'script-src': "'self' ws://0.0.0.0:35729 'unsafe-eval'", // Allow scripts from https://cdn.mxpnl.com
      'font-src': "'self'", // Allow fonts to be loaded from http://fonts.gstatic.com
      'connect-src': "'self' ws://0.0.0.0:35729 http://0.0.0.0:3000 'all'", // Allow data (ajax/websocket) from api.mixpanel.com and custom-api.local
      'img-src': "'self'",
      'style-src': "'self' 'unsafe-inline'", // Allow inline styles and loaded CSS from http://fonts.googleapis.com
      'media-src': "'self'"
    }
  }

  if (environment === 'test') {
    // Testem prefers this...
    ENV.baseURL = '/';
    ENV.locationType = 'none';

    // keep test console output quieter
    ENV.APP.LOG_ACTIVE_GENERATION = false;
    ENV.APP.LOG_VIEW_LOOKUPS = false;

    ENV.APP.rootElement = '#ember-testing';
  }

  if (environment === 'production') {
    var connectSrcString = "'self' " + ENV.host;
    ENV.contentSecurityPolicy = {
      'default-src': "'none'",
      'script-src': "'self'",
      'font-src': "'self'",
      'connect-src': connectSrcString,
      'img-src': "'self'",
      'style-src': "'self'",
      'media-src': "'self'"
    }
  }

  return ENV;
};
