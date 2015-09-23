var bacteriaApp = angular.module('BacteriaApp', []);

bacteriaApp.controller('BacteriaListCtrl', function ($scope) {
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