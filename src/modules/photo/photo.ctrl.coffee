angular.module 'tipstravel'

.classy.controller

  name: 'photoCtrl'

  inject: [
    '$scope'
  ]

  init: ->
    @$scope.tips = "follow and share the interesting travel tips"
