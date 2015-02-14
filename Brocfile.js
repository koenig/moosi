/* global require, module */

var EmberApp = require('ember-cli/lib/broccoli/ember-app');

var app = new EmberApp({
  vendorFiles: {
    'handlebars.js': null
  },
  fingerprint: {
    enabled: true    
  },
  outputPaths: {
    app: {
      html: 'index.html',
      css: {
        'app': '/assets/moosi.css'
      },
      js: '/assets/moosi.js'
    },
    vendor: {
      css: '/assets/hidden/vendor.css',
      js: '/assets/vendor.js'
    }
  }
});

// Use `app.import` to add additional libraries to the generated
// output files.
//
// If you need to use different assets in different
// environments, specify an object as the first parameter. That
// object's keys should be the environment name and the values
// should be the asset to use in that environment.
//
// If the library that you are including contains AMD or ES6
// modules that you would like to import into your application
// please specify an object with the list of modules as keys
// along with the exports of each module as its value.

// app.import('bower_components/ionic/css/ionic.css');
app.import('bower_components/fastclick/lib/fastclick.js');
app.import('bower_components/currency.js/currency.js');
module.exports = app.toTree();
