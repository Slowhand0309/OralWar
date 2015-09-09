var menuApp = angular.module('menuApp', []);

menuApp.controller('MenuListCtrl', function ($scope) {

  // function onClick
  $scope.onClick = function() {
    location.href = "http://www.google.com";
  };
});