/* jshint node: true */

module.exports = function(environment) {
  var ENV = {
    modulePrefix: 'graph-components',
    podModulePrefix: 'graph-components/pods',
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

  if (environment === 'development') {
    ENV.apiHost  = 'http://localhost:3000';
    // ENV.APP.LOG_RESOLVER = true;
    // ENV.APP.LOG_ACTIVE_GENERATION = true;
    // ENV.APP.LOG_TRANSITIONS = true;
    // ENV.APP.LOG_TRANSITIONS_INTERNAL = true;
    // ENV.APP.LOG_VIEW_LOOKUPS = true;
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

  }

  ENV.contentSecurityPolicy = {
    'connect-src': "'self' api.mixpanel.com www.bugherd.com bl.ocks.org api.mixpanel.com custom-api.local localhost:3000",
    'script-src':  "'self' cdn.mxpnl.com ssljscdn.airbrake.io www.bugherd.com " +
                   'www.google-analytics.com d2iiunr5ws5ch1.cloudfront.net ' +
                   '34a7a1f9164c48c1b61f-84378afe43d6d6b04d77869b7b49ff0e.ssl.cf2.rackcdn.com bl.ocks.org d3js.org',
    'media-src':   "'self' ",
    'frame-src':   "'self' ",
    'font-src':    "'self' www.bugherd.com fonts.gstatic.com",
    'style-src':   "'self' fonts.googleapis.com d2iiunr5ws5ch1.cloudfront.net " +
                   '34a7a1f9164c48c1b61f-84378afe43d6d6b04d77869b7b49ff0e.ssl.cf2.rackcdn.com ',
    'img-src':     "'self' data: " +
                   'plus.google.com ipv4.google.com ssl.gstatic.com ' +
                   'www.google-analytics.com d2iiunr5ws5ch1.cloudfront.net ' +
                   '34a7a1f9164c48c1b61f-84378afe43d6d6b04d77869b7b49ff0e.ssl.cf2.rackcdn.com '
  }

  return ENV;
};
