(function () {

  'use strict';

  function HomeController () {
    var vm = this;

    vm.name = "Fat Albert"

  }
  angular
    .module('store')
    .controller('HomeController', HomeController)

}());
