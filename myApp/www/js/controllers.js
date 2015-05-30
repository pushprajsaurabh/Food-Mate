angular.module('starter.controllers', [])

.controller('DashCtrl', function($scope, $state) {
    if(window.localStorage.session_token){
    } else {
        $state.go('login', {}, {reload: true});
        window.location.reload(true);
    }
})

.controller('ChatsCtrl', function($scope,$http, Chats, $state, $ionicHistory) {
    if(window.localStorage.session_token){
    $http.get('http://localhost:3000/user_matches/?session_token=' + window.localStorage.session_token).then(function(resp)
    {
        $scope.chats = resp.data.payload ;
    }, function(err) {
            console.error('ERR', err);
            // err.status will contain the status code
          })
    } else{
        $state.go('login', {}, {reload: true});
        window.location.reload(true);
    }
})

.controller('ChatDetailCtrl', function($scope, $stateParams, Chats, $state) {
    if(window.localStorage.session_token){
        $scope.chat = Chats.get($stateParams.chatId);
    } else {
       $state.go('login', {}, {reload: true});
        window.location.reload(true);
    }
})

.controller('AccountCtrl', function($scope, $http, $state) {
    if(window.localStorage.session_token){
  $scope.log_out = function() {
        $http.get('http://localhost:3000/log_out/?session_token=' + window.localStorage.session_token).then(function(resp) {
            window.localStorage.clear();
            $state.go('login');
        }, function(err) {
            console.error('ERR', err);
            // err.status will contain the status code
        })
    }
} else{
    $state.go('login', {}, {reload: true});
    window.location.reload(true);
}
})

.controller('CardsCtrl', function($scope, $http, $state, $ionicPopup) {
    if(window.localStorage.session_token){
        var cardTypes = [];
        $http.get('http://localhost:3000/get_items/?session_token=' + window.localStorage.session_token).then(function(resp) {
            if(resp.data.has_new_match == true){
                        var alertPopup = $ionicPopup.alert({
                            title: 'Match!!',
                            template: 'You found your food buddy!!'
                        });
                    }
            var cardTypes = resp.data.payload ;
            $scope.cards = [];
            $scope.addCard = function(i) {
                var newCard = cardTypes[i];
                newCard.id = i;
                console.log(newCard.item_image_url)
                $scope.cards.push(angular.extend({}, newCard));
            }
            for(var i = 0; i < cardTypes.length; i++) $scope.addCard(i);
            $scope.cardSwipedLeft = function(index) {
                console.log('Left swipe');
            }
            $scope.cardSwipedRight = function(index) {
                var item_id = cardTypes[index].item_id ;
                $http.get('http://localhost:3000/item_liked/?session_token=' + window.localStorage.session_token + '&item_id=' + item_id).then(function(resp) {
                    if(resp.data.has_new_match == true){
                        var alertPopup = $ionicPopup.alert({
                            title: 'Match!!',
                            template: 'You found your food buddy!!'
                        });
                    }
                }, function(err) {
                console.error('ERR', err);
                // err.status will contain the status code
              })
            }
            $scope.cardDestroyed = function(index) {
                $scope.cards.splice(index, 1);
                console.log('Card removed');
                if($scope.cards.length == 0){
                    var alertPopup = $ionicPopup.alert({
                        title: 'See you again!!',
                        template: 'You are out of likes for today!!!'
                    });
                }
            }
          }, function(err) {
            console.error('ERR', err);
            // err.status will contain the status code
          })
    } else {
        $state.go('login', {}, {reload: true});
        window.location.reload(true);
    }
})
.controller('LoginCtrl', function($scope, LoginService, $ionicPopup, $state, $http) {
    $scope.data = {};
    $scope.login = function() {
        if($scope.data.phone && $scope.data.password){
          $http.post('http://localhost:3000/log_in/', $scope.data).success(function(data) {
                    window.localStorage.session_token = data.payload.session_token;
                    $state.go('tab.dash', {}, {reload: true});
                    window.location.reload(true);
                })
                .error(function(data) {
                    var alertPopup = $ionicPopup.alert({
                        title: 'Login failed!',
                        template: 'Please check your credentials!'
                    });
                });
        } else
        {
            var alertPopup = $ionicPopup.alert({
                title: 'Login failed!',
                template: 'Please check your credentials!'
            });
        }
    }
})

.controller('SignUpCtrl', function($scope, $http, $state, $ionicPopup){
    $scope.data = {};
    $scope.sign_up = function(){
        if($scope.data.name && $scope.data.phone && $scope.data.password && $scope.data.password_confirmation){
          $http.post('http://localhost:3000/sign_up/', $scope.data).success(function(data) {
            var alertPopup = $ionicPopup.alert({
                        title: 'Sign Up success!!',
                        template: data.message
                    });
                    $state.go('login');
                })
                .error(function(data) {
                    var alertPopup = $ionicPopup.alert({
                        title: 'Sign Up validation',
                        template: data.message
                    });
                });
        } else
        {
            var alertPopup = $ionicPopup.alert({
                title: 'Sign Up validation',
                template: 'Please enter valid information.'
            });
        }
    };
});
