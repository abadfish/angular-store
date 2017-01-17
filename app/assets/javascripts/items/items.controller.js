(function () {

  'use strict';

  function ItemsController (ItemFactory) {

    var vm = this;
    vm.getItems = getItems;

    activate();

    function activate() {
      getItems();
    }

    function getItems() {
      return ItemFactory.getItems()
          .then(setItems);
    }

    function setItems(data) {
      return vm.items = data
      console.log(data)
    }


  }
  angular
    .module('store')
    .controller('ItemsController', ItemsController)

}());
