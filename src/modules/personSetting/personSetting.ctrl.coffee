angular.module 'tipstravel'

.classy.controller

  name: 'personSettingCtrl'

  inject: [
    '$scope'
    '$state'
    'Global'
  ]

  init: ->
    @$scope.hello = 'User Setting'