angular.module 'tipstravel'

.classy.controller

  name: 'navbarCtrl'

  inject: [
    '$scope'
    'Global'
    '$state'
  ]

  init: ->
    @$scope.hello = 'Hello world!'

  methods:
    goDashboard: ->
      @$state.go 'dashboard'

    goSearch: ->
      @$state.go 'search'
