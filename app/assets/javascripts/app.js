(function () {
  'use strict';


  angular
    .module('store', ['ui.router', 'templates'])
    .config(function($httpProvider) {
      $httpProvider.defaults.headers.common['X-CSRF-TOKEN'] = $('meta[name=csrf-token]').attr('content');
    })

}());
