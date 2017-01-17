(function() {
  'use strict';

  angular
    .module('store')
    .config(function($stateProvider, $urlRouterProvider) {
      $stateProvider
        .state('home', {
            url: '/',
            templateUrl: 'home/home.html',
            controller: 'HomeController as vm'
        })
        .state('home.items', {
          url: 'items',
          templateUrl: 'items/items.html',
          controller: 'ItemsController as vm'
        })
        .state('home.item', {
          url: 'items/:id',
          templateUrl: 'items/item.html',
          controller: 'ItemsController as vm'
        })
        $urlRouterProvider.otherwise('/')
    })

}());
