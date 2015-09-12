var menuApp = angular.module('menuApp', []);

menuApp.controller('MenuListCtrl', function ($scope) {
  $scope.menus = [
    {'name': 'ゲームスタート',
     'describe': 'ゲームを開始'},
    {'name': '菌リスト',
     'describe': '集めた菌を見る'},
    {'name': 'アイテムリスト',
     'describe': '集めたアイテムを見る'}
  ];
                   
  // function onClick
  $scope.onClick = function() {
    location.href = "http://www.google.com";
  };
});