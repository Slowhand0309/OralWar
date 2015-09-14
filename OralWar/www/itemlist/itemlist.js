var itemApp = angular.module('ItemApp', []);

itemApp.controller('ItemListCtrl', function ($scope) {
                   
  // function onClick
  $scope.onClick = function(id) {
    var url = "oral://view/" + id
    location.href = url;
  };

  // function onBack
  $scope.onBack = function() {
    history.back();
  }
});