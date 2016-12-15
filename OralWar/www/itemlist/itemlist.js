var itemApp = angular.module('ItemApp', []);

itemApp.controller('ItemListCtrl', function ($scope, $http) {
                   
  // function onClick
  $scope.onClick = function(id) {
    var url = "oral://view/" + id
    location.href = url;
  };

  // function onBack
  $scope.onBack = function() {
    history.back();
  };

  var $uri = 'itemlist.json';
  $scope.init = function() {
    alert('onload');
                   $http({
                         method : 'GET',
                         url : $uri
                         }).success(function(data, status, headers, config) {
                                    $scope.results = data;
                                    }).error(function(data, status, headers, config) {
                                             console.log(status);
                                             });
  };
});
