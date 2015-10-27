var menuApp = angular.module('menuApp', []);

menuApp.controller('MenuListCtrl', function ($scope) {
  $scope.menus = [
    {'id' : 'bacterialist',
     'name': '菌リスト',
     'describe': '集めた菌を見る'},
    {'id' : 'gamestart',
     'name': 'ゲームスタート',
     'describe': 'ゲームを開始'},
    {'id' : 'itemlist',
     'name': 'アイテムリスト',
     'describe': '集めたアイテムを見る'}
  ];
                   
  // function onClick
  $scope.onClick = function(id) {
    var url = "oral://view/" + id
    location.href = url;
  };
});