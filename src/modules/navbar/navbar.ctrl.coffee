angular.module 'tipstravel'

.classy.controller

  name: 'navbarCtrl'

  inject: [
    '$scope'
    'Global'
  ]

  init: ->
    @$scope.hello = 'Hello world!'