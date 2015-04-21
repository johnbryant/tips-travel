angular.module 'tipstravel'

.classy.controller

  name: 'searchCtrl'

  inject: [
    '$scope'
  ]

  init: ->
    @$scope.tips = "follow and share the interesting travel tips"
