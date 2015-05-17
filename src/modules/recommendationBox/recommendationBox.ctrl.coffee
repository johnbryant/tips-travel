angular.module 'tipstravel'

.classy.controller

  name: 'recommendationBoxCtrl'

  inject: [
    '$scope'
    'apiTips'
    'Global'
    'Reddit'
  ]

  init: ->
    @$scope.hello = 'Hello there, '
    @$scope.introduction = 'TipsTravel helps you discover and share interesting travel tips.Let\'s get started by setting up your home feed.'
    @$scope.username = 'john'
    @$scope.welcome_show = true
    @$scope.selectFollow_show = false



  methods:
    goFollowBox: ->
      @$scope.welcome_show = false
      @$scope.selectFollow_show = true
