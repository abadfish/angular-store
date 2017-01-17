(function() {

    'use strict';

  function ItemFactory($http) {

        return {
          getItems: getItems,
          getItem: getItem
        }

    function getItems() {
      console.log("E")
        return $http.get('/items')
            .then(handleResponse)
            .catch(handleError);
    }

    function getItem(itemId) {
        return $http.get('/items/' + itemId)
            .then(handleResponse)
            .catch(handleError);
    }

    function handleResponse(response) {
      console.log("F")
        return response.data
    }

    function handleError(error) {
        console.log(error)
    }
  }

    angular
    .module('store')
    .factory('ItemFactory', ItemFactory)
}())
